require 'rails_helper'

feature 'user visits their profile page' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:event) { FactoryGirl.create(:event, user: user) }

  scenario 'user clicks on profile link at top of the page' do
    login_as(user, scope: :user)
    visit root_path
    click_link "Profile"

    expect(page).to have_content(user.company)
    expect(page).to have_content("Products")
    expect(page).to have_content("Events")
    expect(page).to have_content("About")
  end

  scenario 'user clicks on event title and is redirected' do
    login_as(user, scope: :user)
    visit user_path(user)
    click_link event.name

    expect(page).to have_content(event.name)
  end

end
