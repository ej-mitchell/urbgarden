class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :company, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :zip, length: { minimum: 5, maximum: 9 }
  validates :zip, format: { with: /\b\d{5}(-\d{4})?\b/ }
  validates :email, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
