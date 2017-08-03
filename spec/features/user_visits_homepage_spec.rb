require 'rails_helper'
=begin
  [] As a user (authenticated or not) when I visit the homepage,
  I should see a list of clickable events sorted by date added
  [] As an authenticated user, I should be able to navigate to my
  profile from the top bar
=end

feature 'user visits the homepage' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:event) { FactoryGirl.create(:event, user: user) }
  let!(:event2) { FactoryGirl.create(:event, user: user) }


  scenario 'user sees a list of events' do
    visit root_path
    expect(page).to have_content("Upcoming Events")
  end

  scenario 'user clicks on Profile button on the top bar' do
    login_as(user, scope: :user)
    visit root_path
    click_link "Profile"
    expect(page).to have_content("Google")
  end

  scenario 'user clicks on Add Event button at top of page' do
    login_as(user, scope: :user)
    visit root_path
    click_link "Add Event"
    expect(page).to have_content("Add New Event")
  end
end
