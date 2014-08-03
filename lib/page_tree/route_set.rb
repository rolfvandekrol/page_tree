module PageTree
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
          end
        end
    end
  end
end