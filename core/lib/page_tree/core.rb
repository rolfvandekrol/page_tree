require 'awesome_nested_set'
require 'friendly_id'

module PageTree
  module Core
    autoload :SlugGenerator, "page_tree/core/slug_generator"
    autoload :AppDecorators, "page_tree/core/app_decorators"
    autoload :Preferences, "page_tree/core/preferences"
  end
end

require "page_tree/core/engine"