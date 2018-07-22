class Transaction < ApplicationRecord
    belongs_to :category, :optional => true

    validates :business, presence: false
    validates :amount, presence: false
    before_save :downcase_fields
    

   def downcase_fields
      if self.business then
        self.business.downcase!
      end
   end
end
