module PageTree
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=page_tree'
      end

      def run_migrations
        run 'bundle exec rake db:migrate'
      end

      def add_routes
        insert_into_file File.join('config', 'routes.rb'), :after => "Rails.application.routes.draw do\n" do
          %Q{
  mount PageTree::Engine, :at => '/'

}
        end
      end
    end
  end
end