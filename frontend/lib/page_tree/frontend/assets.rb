module PageTree
  module Frontend
    module Assets
      module Js
        extend self

        def assets
          ['page_tree/pages']
        end
      end

      module Css
        extend self

        def assets
          []
        end
      end
    end
  end
end
