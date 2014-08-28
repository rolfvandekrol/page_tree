module PageTree
  module Markdown

    module Generators
      class InstallGenerator < Rails::Generators::Base
        def self.source_paths
          paths = self.superclass.source_paths
          paths << File.expand_path('../templates', __FILE__)
          paths.flatten
        end

        def add_migrations
          run 'bundle exec rake railties:install:migrations FROM=page_tree_markdown'
        end

        def run_migrations
          run 'bundle exec rake db:migrate'
        end

        def add_initializers
          template 'config/initializers/page_tree_markdown.rb', 'config/initializers/page_tree_markdown.rb'
        end
      end
    end
  end
end