require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should have_valid(:name).when("carrots") }
  it { should have_valid(:price).when("10.00", "1.09", "15.99", "1,000.00") }
  it { should have_valid(:unit).when("pint", "quart", "dozen", "lb", "oz") }
  it { should have_valid(:grower_id).when(1, 2, 3209)}

  it { should_not have_valid(:name).when("", nil) }
  it { should_not have_valid(:price).when("", nil, ".5", "3.4", "34.6", "3,000.123") }
  it { should_not have_valid(:unit).when("", nil) }
  it { should_not have_valid(:grower_id).when("", nil) }
end
