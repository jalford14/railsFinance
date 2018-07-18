class Transaction < ApplicationRecord
    validates :category, presence: true
    validates :business, presence: true
    validates :amount, presence: true,
            numericality: { greater_than: 0 }
    before_save :downcase_fields

   def downcase_fields
      self.category.downcase!
      self.business.downcase!
   end
end
