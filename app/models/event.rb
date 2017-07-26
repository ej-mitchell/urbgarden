class Event < ApplicationRecord
  belongs_to :grower, class_name: "User"

  validates :name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :event_url, format: { with: /https?:\/\/[\S]+/, allow_blank: true }
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :map_url, format: { with: /https?:\/\/[\S]+/, allow_blank: true }
  validates :grower_id, presence: true
end
