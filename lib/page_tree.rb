require 'awesome_nested_set'
require 'friendly_id'
require 'kramdown'
require 'foundation-rails'

require "page_tree/engine"

module PageTree
  autoload :RoutesRecognizer, "page_tree/routes_recognizer"
  autoload :SlugGenerator, "page_tree/slug_generator"      
end
