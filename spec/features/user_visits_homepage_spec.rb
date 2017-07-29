require 'rails_helper'
=begin
  [] As a user (authenticated or not) when I visit the homepage,
  I should see a list of clickable events sorted by date added
  [] As an authenticated user, I should be able to navigate to my
  profile from the top bar
=end

feature 'user visits the homepage' do
  let!(:event) { FactoryGirl.create(:event) }
  let!(:event2) { FactoryGirl.create(:event) }
  let!(:user) { FactoryGirl.create(:user) }
  
  scenario 'user sees a list of events' do
    visit root_path
    expect(page).to have_content("Upcoming Events")
    expect(page).to have_content(event.name)
    expect(page).to have_content(event2.name)
  end

  scenario 'user clicks on an event and is brought to its show page' do
    visit root_path
    click_link event.name
    expect(page).to have_content('221B Baker Street')
  end

  scenario 'user clicks on Profile button on the top bar' do
    login_as(user, scope: :user)
    visit root_path
    click_link "Profile"
    expect(page).to have_content("Google")
  end
end
