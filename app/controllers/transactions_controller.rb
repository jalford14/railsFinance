class TransactionsController < ApplicationController

    def index
        @transaction = Transaction.all
        @category = Category.all
    end

    def show
        @transaction = Transaction.find(params[:id])
    end

    def new
        @transaction = Transaction.new
        @category = Category.new
        @category.transactions.build
    end

    def edit
        @transaction = Transaction.find(params[:id])
    end

    def create
        #render plain: params[:transaction]
        @category = Category.new(category_params)
        @transaction = Transaction.new(transaction_params)
        
        render plain: @category.to_json
        # if @transaction.save && @category.save
        #     redirect_to @transaction
        # else
        #     render 'new'
        # end
    end

    def update
        @transaction = Transaction.find(params[:id])
        
        if @transaction.update(transaction_params)
            redirect_to @transaction
        else
            render 'edit'
        end
    end

    def destroy
        @transaction = Transaction.find(params[:id])
        @transaction.destroy
        
        redirect_to transactions_path
    end

    private
        def transaction_params
            params.require(:transaction).permit(:business, :amount)
        end

        def category_params
            params.require(:transaction).permit(:category, category_attributes: [:category])
        end

end
