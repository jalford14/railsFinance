class TransactionsController < ApplicationController

    def show
        @transaction = Transaction.find(params[:id])
    end

    def new
    end

    def create
        @transaction = Transaction.new(params[:transaction].permit(:category, :business, :amount))
        
        @transaction.save
        redirect_to @transaction
    end

    private
    def transaction_params
        params.require(:transaction).permit(:category, :business, :amount)
      end

end
