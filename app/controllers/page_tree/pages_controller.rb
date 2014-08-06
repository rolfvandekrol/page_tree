require_dependency "page_tree/application_controller"

module PageTree
  class PagesController < ApplicationController
    include PageTree::PageLoader

    def show
    end

    def edit
    end

    def update
      respond_to do |format|
        if @page.update_attributes(page_params)
          format.html { redirect_to @page, notice: 'Page was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @page.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
    end

    def create
      @new_page = @page.children.new(page_params)
      
      respond_to do |format|
        if @page.save
          format.html { redirect_to @new_page, notice: 'Page was successfully created.' }
          format.json { render json: [@page],
                               status: :created, 
                               location: [@page] }
        else
          format.html { render action: "new" }
          format.json { render json: @job.errors, status: :unprocessable_entity }
        end
      end
    end

    def new
      @new_page = @page.children.build
    end

    def page_params
      params.require(:page).permit(:title, :body)
    end

    def move_up
      @page.move_left
      redirect_to @page, notice: 'Page was successfully moved.'
    end

    def move_down
      @page.move_right
      redirect_to @page, notice: 'Page was successfully moved.'
    end
  end
end
