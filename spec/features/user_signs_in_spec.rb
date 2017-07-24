require 'rails_helper'

##As a user, I want to be able to sign in to access my content##
###Acceptance Criteria###
=begin
[] If I'm already signed up, I should be able to access my content with an email and password
[] If I'm not signed up, my email/password will not work (unauthenticated)
[] I can't sign in twice--so, if I'm signed in, I should only see a 'sign out' button
=end

feature 'user signs in' do
  scenario 'authenticated user signs in' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link "Sign In"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    expect(page).to have_content("Signed in successfully")
    expect(page).to have_content("Sign Out")
  end

  scenario 'unauthenticated user attempts to sign in' do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: "Joe@example.com"
    fill_in "Password", with: "totallyfakepassword"

    click_button "Log in"

    expect(page).to have_content("Invalid Email or password")
    expect(page).to_not have_content("Sign Out")
  end

  scenario 'an unauthenticated user attempts to sign in with an incorrect password and correct email' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: "totallyfakepassword"

    click_button "Log in"

    expect(page).to have_content("Invalid Email or password")
    expect(page).to_not have_content("Sign Out")
  end

  scenario 'authenticated user attempts to sign in twice' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content('Sign Out')
    expect(page).to_not have_content('Sign In')

    visit new_user_session_path
    expect(page).to have_content('You are already signed in.')
  end

end
