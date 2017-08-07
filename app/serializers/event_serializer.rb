class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :start_time, :end_time, :event_url, :address, :city, :state, :updated_at, :user_id
  has_many :user_events
  belongs_to :user
end
