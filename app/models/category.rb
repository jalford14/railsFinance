 # IF YOU NEED TO ERASE DATA USE THIS COMMAND
 # rake db:schema:load

class Category < ApplicationRecord
    has_many :transactions, foreign_key: "category_id", class_name: "Transaction"
    validates :category, uniqueness: { case_sensitive: false }, presence: true

    before_save :downcase_fields

    def downcase_fields
        self.category.downcase!
        if self.business then
            self.business.downcase!
        end
    end
end
