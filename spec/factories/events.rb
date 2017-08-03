FactoryGirl.define do
  factory :event do
    sequence(:name) { |n| "Event #{n}" }
    description "I am a description"
    start_time "2011-12-01 09:09:09"
    end_time  "2011-12-01 11:11:11"
    event_url "http://google.com"
    address '221B Baker Street'
    city 'London'
    state 'MA'
    map_url "http://google.com/maps"

  end
end
