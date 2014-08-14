module PageTree
  module Frontend

    module Generators
      class InstallGenerator < Rails::Generators::Base
        def add_routes
          insert_into_file File.join('config', 'routes.rb'), :after => "Rails.application.routes.draw do\n" do
            %Q{
    mount PageTree::Frontend::Engine, :at => '/'

  }
          end
        end
      end
    end
  end
end