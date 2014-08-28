module PageTree
  module Markdown
    class Config
      include PageTree::Core::Preferences::Configuration

      preference :content_types, []
    end
  end
end
