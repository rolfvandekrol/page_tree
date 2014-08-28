require 'active_support'

module PageTree
  module Core
    module Preferences
      module Configuration
        extend ActiveSupport::Concern

        included do
          extend ConfigurationClassMethods
        end
      end
    end
  end
end
