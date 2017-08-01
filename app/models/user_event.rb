class UserEvent < ApplicationRecord
  belongs_to :event
  belongs_to :grower, class_name: "User"

  validates :event_id, presence: true
  validates :grower_id, presence: true
end
