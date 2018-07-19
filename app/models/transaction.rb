class Transaction < ApplicationRecord
    validates :category, uniqueness: { case_sensitive: false }, presence: true
    validates :business, presence: false
    validates :amount, presence: false
    before_save :downcase_fields

   def downcase_fields
      self.category.downcase!
      if self.business then
        self.business.downcase!
      end
   end
end
