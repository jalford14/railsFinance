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
        @transaction = Transaction.new(transaction_params)
        
        if @category.save && @transaction.save
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
        def transaction_params
            params.require(:category).permit(category_attributes: [:business, :amount])
        end
        
        def category_params
            params.require(:category).permit(:category, transactions_attributes: [:business, :amount])
        end

end
