RSpec.describe Order, type: :model do
  it { should_not have_valid(:user_id).when("", nil) }
  it { should_not have_valid(:event_id).when("", nil) }
  it { should_not have_valid(:email).when("", nil) }
  it { should_not have_valid(:name).when("", nil) }
  it { should_not have_valid(:email).when("", nil, "ex@com", "ex.com") }
end