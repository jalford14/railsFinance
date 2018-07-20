class CategoriesController < ApplicationController
    def index
        @category = Transaction.all
    end

    def show
        @category = Transaction.all
    end

    def new
        @category = Transaction.new
    end

    def create
        @category = Transaction.new(transaction_params)
        
        if @category.save
            redirect_to @category
        else
            render 'new'
        end
    end

    def destroy
        @category = Transaction.find(params[:id])
        @category.destroy
        
        redirect_to categories_path
    end
end
