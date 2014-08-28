require 'page_tree/frontend'

require 'kramdown'

module PageTree
  module Markdown
    autoload :Config, "page_tree/markdown/config"
  end
end

require 'page_tree/markdown/engine'