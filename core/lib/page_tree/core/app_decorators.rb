require 'active_support'

module PageTree
  module Core
    module AppDecorators
      extend ActiveSupport::Concern

      included do
        engine = self
        config.to_prepare do
          Dir.glob(engine.root + "app/**/*_decorator.rb").each do |c|
            require_dependency(c)
          end
        end
      end
    end
  end
end