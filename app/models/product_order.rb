class ProductOrder < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, format: {with: /\A[0-9]{1,3}\.[0-9]{2}\z/}
  validates :product_id, presence: true
  validates :order_id, presence: true
  validates :event_id, presence: true
end
