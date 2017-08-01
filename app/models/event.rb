class Event < ApplicationRecord

  STATES = [
    ["AK", "Alaska"],
    ["AL", "Alabama"],
    ["AR", "Arkansas"],
    ["AZ", "Arizona"],
    ["CA", "California"],
    ["CO", "Colorado"],
    ["CT", "Connecticut"],
    ["DE", "Delaware"],
    ["FL", "Florida"],
    ["GA", "Georgia"],
    ["HI", "Hawaii"],
    ["IA", "Iowa"],
    ["ID", "Idaho"],
    ["IL", "Illinois"],
    ["IN", "Indiana"],
    ["KS", "Kansas"],
    ["KY", "Kentucky"],
    ["LA", "Louisiana"],
    ["MA", "Massachusetts"],
    ["MD", "Maryland"],
    ["ME", "Maine"],
    ["MI", "Michigan"],
    ["MN", "Minnesota"],
    ["MO", "Missouri"],
    ["MS", "Mississippi"],
    ["MT", "Montana"],
    ["NC", "North Carolina"],
    ["ND", "North Dakota"],
    ["NE", "Nebraska"],
    ["NH", "New Hampshire"],
    ["NJ", "New Jersey"],
    ["NM", "New Mexico"],
    ["NV", "Nevada"],
    ["NY", "New York"],
    ["OH", "Ohio"],
    ["OK", "Oklahoma"],
    ["OR", "Oregon"],
    ["PA", "Pennsylvania"],
    ["RI", "Rhode Island"],
    ["SC", "South Carolina"],
    ["SD", "South Dakota"],
    ["TN", "Tennessee"],
    ["TX", "Texas"],
    ["UT", "Utah"],
    ["VA", "Virginia"],
    ["VI", "Virgin Islands"],
    ["VT", "Vermont"],
    ["WA", "Washington"],
    ["WI", "Wisconsin"],
    ["WV", "West Virginia"],
    ["WY", "Wyoming"]
  ]

  validates :name, presence: true
  validates :description, length: { maximum: 2000 }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :event_url, format: { with: /https?:\/\/[\S]+/, allow_blank: true }
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :map_url, format: { with: /https?:\/\/[\S]+/, allow_blank: true }

  def self.search(search)
    where("name ILIKE ? OR city ILIKE ? OR state ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
