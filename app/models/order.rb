class Order < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :product_orders, dependent: :destroy
  has_many :products, through: :product_orders

  accepts_nested_attributes_for :product_orders

  validates :email, presence: true
  validates :email, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
  validates :name, presence: true


end
