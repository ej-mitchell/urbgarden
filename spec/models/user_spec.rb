require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_valid(:first_name).when("Jake") }
  it { should have_valid(:last_name).when("Bobberts") }
  it { should have_valid(:company).when("Google") }
  it { should have_valid(:address).when("221B Baker St") }
  it { should have_valid(:state).when("MA", "CT") }
  it { should have_valid(:city).when("Boston", "Providence") }
  it { should have_valid(:zip).when("00123", "34567", "00012-1234") }
  it { should have_valid(:email).when("user@example.com", "bob@yahoo.com") }

  it { should_not have_valid(:first_name).when("", nil) }
  it { should_not have_valid(:last_name).when("", nil) }
  it { should_not have_valid(:company).when("", nil) }
  it { should_not have_valid(:address).when("", nil) }
  it { should_not have_valid(:state).when("", nil) }
  it { should_not have_valid(:city).when("", nil) }
  it { should_not have_valid(:zip).when("", nil, 01, "1", "abc12") }
  it { should_not have_valid(:email).when("", nil, "ex@com", "ex.com") }

  it 'should have a matching password confirmation for the password' do
    user = User.new
    user.password = "password"
    user.password_confirmation = "somethingelse"

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end
