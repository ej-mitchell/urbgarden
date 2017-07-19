require 'rails_helper'

##As a user, I want to be able to sign in to access my content##
###Acceptance Criteria###
=begin
[] If I'm already signed up, I should be able to access my content with an email and password
[] If I'm not signed up, my email/password will not work (unauthenticated)
[] I can't sign in twice--so, if I'm signed in, I should only see a 'sign out' button
=end

feature 'user signs in', pending: true do
  scenario 'authenticated user signs in' do
    visit root_path
    click_on "Sign In"

    fill_in :email, with: "jon@example.com"
    fill_in :password, with: "jonPassword"

    click_on "Sign In"

    expect(page).to have("Welcome!")
  end

  scenario 'unauthenticated user attempts to sign in' do
    visit root_path
    click_on "Sign In"
    fill_in :email, with: "Joe@example.com"
    fill_in :password, with: "totallyfakepassword"

    click_on "Sign In"

    expect(page).to have("We don't have an account associated with this email/password.")
  end

  scenario 'authenticated user attempts to sign in twice' do

  end

end
