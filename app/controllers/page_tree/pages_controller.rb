require_dependency "page_tree/application_controller"

module PageTree
  class PagesController < ApplicationController
    include PageTree::PageLoader

    def show
    end
  end
end
