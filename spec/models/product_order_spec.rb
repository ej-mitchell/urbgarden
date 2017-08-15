RSpec.describe ProductOrder, type: :model do
  it { should_not have_valid(:product_id).when("", nil) }
  it { should_not have_valid(:order_id).when("", nil) }
  it { should_not have_valid(:quantity).when("", nil, "a", "02a", ".02", "1000") }
  
  it{ should have_valid(:quantity).when("1", "1.5", "0.3", "12.1") }
end