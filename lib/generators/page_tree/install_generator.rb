module PageTree
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def install_core
        run 'bundle exec rails generate page_tree:core:install'
      end
      def install_frontend
        run 'bundle exec rails generate page_tree:frontend:install'
      end
      def install_markdown
        run 'bundle exec rails generate page_tree:markdown:install'
      end
    end
  end
end