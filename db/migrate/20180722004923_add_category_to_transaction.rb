class AddCategoryToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_reference :transactions, :category, foreign_key: true
    add_foreign_key :transactions, :categories
  end
end
