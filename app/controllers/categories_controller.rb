class CategoriesController < ApplicationController
    def index
        @category = Category.all
    end

    def show
        @category = Category.find(params[:id])
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        
        if @category.save
            redirect_to @category
        else
            render 'new'
        end
    end

    def destroy
        @category = Category.find(params[:id])
        @category.destroy
        
        redirect_to categories_path
    end

    private
        def category_params
            params.require(:category).permit(:category)
        end

end
