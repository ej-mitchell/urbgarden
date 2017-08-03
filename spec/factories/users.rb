FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    first_name 'John'
    last_name 'Smith'
    sequence(:company) {|n| "Google#{n}"}
    address '221B Baker Street'
    city 'London'
    state 'MA'
    zip '00000'
    password 'password'
    password_confirmation 'password'
  end
end
