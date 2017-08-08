class Product < ApplicationRecord
  belongs_to :grower, class_name: "User"
  has_many :product_orders
  has_many :orders, through: :product_orders

  validates :name, presence: true
  validates :price, presence: true
  validates :price, format: { with: /\A[0-9]{1,3}(?:,?[0-9]{3})*\.[0-9]{2}\z/ }
  validates :unit, presence: true
  validates :grower_id, presence: true
end
