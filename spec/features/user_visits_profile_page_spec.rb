require 'rails_helper'

feature 'user visits their profile page' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:event) { FactoryGirl.create(:event, user: user) }
  let!(:product) { FactoryGirl.create(:product, grower: user) }

  scenario 'user clicks on profile link at top of the page' do
    login_as(user, scope: :user)
    visit root_path
    click_link "Profile"

    expect(page).to have_content(user.company)
    expect(page).to have_content("Products")
    expect(page).to have_content("Events")
    expect(page).to have_content("About")
  end
  
  scenario 'user sees edit/delete buttons next to product' do
    login_as(user, scope: :user)
    visit user_path(user)
    
    expect(page).to have_button("Edit")
    expect(page).to have_button("Delete")
    expect(page).to have_link("Add new product")
  end

  scenario 'user clicks on event title and is redirected' do
    login_as(user, scope: :user)
    visit user_path(user)
    click_link event.name

    expect(page).to have_content(event.name)
  end
  
  scenario 'user clicks on edit profile link' do
    login_as(user, scope: :user)
    visit user_path(user)
    click_link "Edit Profile"
    
    expect(page).to have_button("Update")
  end

end
