module PageTree
  module Frontend
    class Engine < ::Rails::Engine
      class << self
        def frontend_isolate_namespace
          railtie = self
          PageTree::Frontend.singleton_class.instance_eval do
            define_method(:railtie_routes_url_helpers) { railtie.routes.url_helpers }
          end
        end
      end

      frontend_isolate_namespace

      def routes
        if @routes.nil?
          @routes = PageTree::Frontend::RouteSet.new
          # @routes.default_scope = { }
        end

        @routes.append(&Proc.new) if block_given?
        @routes
      end

      initializer "page_tree_frontend.reserved_slugs" do
        [:after_initialize, :to_prepare].each do |hook|
          config.send(hook) do |app|
            Rails.application.reload_routes!
            engine = Rails.application.railties.find{ |railtie| railtie.class == PageTree::Frontend::Engine }
            PageTree::Page.reserved_slugs = PageTree::Frontend::RoutesRecognizer.new(engine).initial_path_segments
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
end
