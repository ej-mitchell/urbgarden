require 'rails_helper'

RSpec.describe UserEvent, type: :model do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:event) { FactoryGirl.create(:event, user: user2) }

  it { should have_valid(:grower).when(user) }
  it { should have_valid(:event).when(event) }

  it { should_not have_valid(:grower_id).when(nil, "") }
  it { should_not have_valid(:event_id).when(nil, "") }

end
