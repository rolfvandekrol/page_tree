require 'awesome_nested_set'
require 'friendly_id'
require 'kramdown'
require 'foundation-rails'

module PageTree
  autoload :RoutesRecognizer, "page_tree/routes_recognizer"
  autoload :SlugGenerator, "page_tree/slug_generator"
  autoload :RouteSet, "page_tree/route_set"
end

require "page_tree/engine"