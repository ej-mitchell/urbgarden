require 'rails_helper'

RSpec.describe Api::V1::EventsController, type: :controller do
  let!(:user){ FactoryGirl.create(:user) }
  let!(:event){ FactoryGirl.create(:event, user: user) }
  let!(:event2){ FactoryGirl.create(:event, user: user) }

  describe "GET#index" do
    it 'should return a list of all events' do
      get :index
      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")
      expect(returned_json.length).to eq(2)
      expect(returned_json.last["name"]).to include(event.name)
      expect(returned_json.first["name"]).to include(event2.name)
    end
  end

end
