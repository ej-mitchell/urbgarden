FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "Product #{n}" }
    price "1.00"
    unit "dozen"
  end
end
