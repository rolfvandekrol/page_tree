module PageTree
  module Frontend
    class RouteSet < ActionDispatch::Routing::RouteSet
      def initialize(request_class = ActionDispatch::Request)
        super(request_class)
        self.named_routes = NamedRouteCollection.new
      end

      class NamedRouteCollection < ActionDispatch::Routing::RouteSet::NamedRouteCollection
        def initialize
          super

          define_page_helpers
        end

        private
          def define_page_helpers
            @module.module_eval do
              define_method(:page_path) do |page, options = {}|
                if (page.respond_to? :id)
                  page = page.id
                end
                
                "/#{PageTree::Page.find(page).path}"
              end

              define_method(:page_url) do |page, options = {}|
                "http://localhost:3000#{page_path(page, options)}"
              end

              define_method(:edit_page_path) do |page, options = {}|
                page_sub_path(page, :edit, options)
              end
              define_method(:move_up_page_path) do |page, options = {}|
                page_sub_path(page, :move_up, options)
              end
              define_method(:move_down_page_path) do |page, options = {}|
                page_sub_path(page, :move_down, options)
              end
              define_method(:new_page_path) do |page, options = {}|
                page_sub_path(page, :new, options)
              end

              define_method(:page_sub_path) do |page, sub, options = {}|
                r = page_path(page, options)
                next "/#{sub}" if r == '/'
                "#{r}/#{sub}"
              end
            end
          end
      end
    end
  end
end