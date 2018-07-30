class CategoriesController < ApplicationController
    def index
        @category = Category.all
    end

    def show
        @category = Category.find(params[:id])
    end

    def new
        @category = Category.new
        @category.transactions.build
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
        Category.where(category: params[:id]).destroy_all
        
        redirect_to categories_path
    end

    private
        def transaction_params
            params.require(:category).permit(category_attributes: [:business, :amount])
        end
        
        def category_params
            params.require(:category).permit(:category, transactions_attributes: [:business, :amount])
        end

end
