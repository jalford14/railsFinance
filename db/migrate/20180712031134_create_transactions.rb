class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :category
      t.string :business
      t.float :amount

      t.timestamps
    end
  end
end
