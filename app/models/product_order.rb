class ProductOrder < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, format: {with: /\A\d{0,2}\.?\d{0,1}\z/}
  validates :product_id, presence: true
  validates :order_id, presence: true
end
