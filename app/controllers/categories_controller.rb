class CategoriesController < ApplicationController
    def index
        @transaction = Transaction.all
    end

    def show
        @category = Transaction.all
    end
end
