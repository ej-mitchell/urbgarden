require 'rails_helper'

feature 'site visitor makes an order' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:event) { FactoryGirl.create(:event, user: user) }
  let!(:user_event) { UserEvent.create(grower: user, event: event) }
  let!(:product) { FactoryGirl.create(:product, grower: user) }

  scenario 'site visitor goes to profile page' do
    visit user_path(user)
    expect(page).to have_link("Make an order!")
    expect(page).to_not have_link("Edit Profile")
  end
  
  scenario 'site visitor goes to first part of order form' do
    visit user_path(user)
    click_link "Make an order!"
    
    expect(page).to have_content("New Order")
  end
  
  # scenario 'site visitor fills out first part of order form' do
  #   visit user_path(user)
  #   click_link "Make an order!"
  #   
  #   fill_in "Name", with: "Bob"
  #   fill_in "Email", with: "bobsaget@email.com"
  #   choose event.name
  #   click_button "Continue to Order"
  #   
  #   expect(page).to have_content("Order Continued")
  # end
end