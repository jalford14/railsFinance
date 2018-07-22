 # IF YOU NEED TO ERASE DATA USE THIS COMMAND
 # rake db:schema:load

class Category < ApplicationRecord
    has_many :transactions
    validates :category, uniqueness: { case_sensitive: false }, presence: true

    before_save :downcase_fields

    def downcase_fields
        self.category.downcase!
    end
end
