module PageTree
  module PageLoader
    extend ActiveSupport::Concern

    included do
      before_action :load_page
    end

    private 
      def load_page
        @page = Page.find(params[:page_id])
      end
  end
end