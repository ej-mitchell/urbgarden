class Event < ApplicationRecord

  validates :name, presence: true
  validates :description, length: { maximum: 2000 }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :event_url, format: { with: /https?:\/\/[\S]+/, allow_blank: true }
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :map_url, format: { with: /https?:\/\/[\S]+/, allow_blank: true }
end
