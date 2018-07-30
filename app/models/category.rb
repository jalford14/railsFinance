 # IF YOU NEED TO ERASE DATA USE THIS COMMAND
 # rake db:schema:load

class Category < ApplicationRecord
    has_many :transactions, dependent: :destroy
    validates :category, presence: true
    accepts_nested_attributes_for :transactions

    before_save :downcase_fields

    def downcase_fields
        self.category.downcase!
    end
    
end
