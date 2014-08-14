require 'page_tree/core'

require 'foundation-rails'
require 'foundation-icons-sass-rails'

module PageTree
  module Frontend
    autoload :RoutesRecognizer, "page_tree/frontend/routes_recognizer"
    autoload :RouteSet, "page_tree/frontend/route_set"
  end
end

require "page_tree/frontend/engine"