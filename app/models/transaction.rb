class Transaction < ApplicationRecord
    validates :business, presence: false
    validates :amount, presence: false
    before_save :downcase_fields
    belongs_to :category

   def downcase_fields
      self.category.downcase!
      if self.business then
        self.business.downcase!
      end
   end
end
