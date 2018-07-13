class Transaction < ApplicationRecord
    validates :category, presence: true
    validates :business, presence: true
    validates :amount, presence: true,
            numericality: { greater_than: 0 }
end
