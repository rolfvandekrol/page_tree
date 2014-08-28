module PageTree
  module Markdown
    class Engine < ::Rails::Engine
      include PageTree::Core::AppDecorators

      isolate_namespace PageTree::Markdown
      
    end
  end
end
