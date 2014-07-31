module PageTree
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=page_tree'
      end

      def run_migrations
        run 'bundle exec rake db:migrate'
      end
    end
  end
end