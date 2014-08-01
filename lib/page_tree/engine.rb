module PageTree
  class Engine < ::Rails::Engine
    isolate_namespace PageTree

    initializer "page_tree.reserved_slugs" do
      [:after_initialize, :to_prepare].each do |hook|
        config.send(hook) do |app|
          Rails.application.reload_routes!
          engine = Rails.application.railties.find{ |railtie| railtie.class == PageTree::Engine }
          PageTree::Page.reserved_slugs = PageTree::RoutesRecognizer.new(engine).initial_path_segments
        end
      end
    end

    def call(env)
      page, path_info = get_page_from_path_info(env['PATH_INFO'].split('/'))
      
      env['PATH_INFO'] = path_info.join('/')
      env['action_dispatch.request.path_parameters'][:page_id] = page.id

      super env
    end

    private
      def get_page_from_path_info(path_info)
        get_page(nil, nil, path_info)
      end

      def get_page_by_slug(parent, slug)
        return PageTree::Page.root unless parent
        parent.children.friendly.find(slug)
      end

      def get_page(parent, slug, rest)
        begin
          page = get_page_by_slug(parent, slug)
          raise ActiveRecord::RecordNotFound if page.nil?
        rescue ActiveRecord::RecordNotFound
          return [parent, [slug] + rest]
        end
        
        if rest.empty?
          return [page, []]
        end

        get_page(page, rest.first, rest.from(1))
      end

  end
end
