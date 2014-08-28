module PageTree
  module Core
    module Preferences
      module ConfigurationClassMethods
        def config
          self.config_store ||= {}
        end

        def configure
          yield self
        end

        def preference(name, default)
          self.config[name] = default
          self.define_methods(name)
        end

        def [](name)
          self.send(name)
        end
        def []=(name, value)
          self.send("#{name}=", value)
        end

        protected
          attr_accessor :config_store

          def define_methods(name)
            self.class_eval <<-RUBY, __FILE__, __LINE__ + 1
              def self.#{name}
                self.config[name]
              end
              def self.#{name}=(*args)
                self.config[name] = args.first
              end
            RUBY
          end
      end
    end
  end
end