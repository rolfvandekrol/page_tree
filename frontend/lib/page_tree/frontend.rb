require 'page_tree/core'

require 'foundation-rails'
require 'foundation-icons-sass-rails'
require 'sprockets-require_module'

module PageTree
  module Frontend
    autoload :RoutesRecognizer, "page_tree/frontend/routes_recognizer"
    autoload :RouteSet, "page_tree/frontend/route_set"

    autoload :Assets, "page_tree/frontend/assets"
  end
end

require "page_tree/frontend/engine"