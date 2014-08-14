require 'awesome_nested_set'
require 'friendly_id'

module PageTree
  module Core
    autoload :SlugGenerator, "page_tree/core/slug_generator"
  end
end

require "page_tree/core/engine"