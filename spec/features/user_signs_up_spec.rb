require 'rails_helper'

##As a user, I want to be able to sign up for the services of this site
###Acceptance Criteria###
=begin
[] I must specify a valid email address
[] I must specify and confirm a valid password
[] I must specify a first name and a last name
[] I must specify a company
[] If I don't specify valid information, I get an error, else I will be an authenticated user.
=end

feature 'user signs up' do
  scenario 'user provides valid information on the form' do
    visit root_path
    click_link "Sign Up"

    fill_in 'First Name', with: "Bob"
    fill_in 'Last Name', with: "Dude"
    fill_in 'Email', with: "bob@example.com"
    fill_in 'Company', with: "Indian Line Farm"
    fill_in 'Address', with: "221B Baker St"
    fill_in 'City', with: "Great Barrington"
    fill_in 'State', with: "MA"
    fill_in 'Zip Code', with: "01230"

    fill_in 'Password', with:"iamapassword"
    fill_in 'Confirm Password', with: "iamapassword"

    click_button "Sign Up"
    expect(page).to have_content("Welcome to UrbGarden!")
    expect(page).to have_content("Sign Out")

  end

  scenario 'user does not provide valid information' do
    visit root_path
    click_link "Sign Up"
    click_button "Sign Up"
    expect(page).to have_content("can't be blank")
  end

  scenario 'user does not provide the same password for both password fields' do
    visit root_path
    click_link "Sign Up"

    fill_in 'First Name', with: "Bob"
    fill_in 'Last Name', with: "Dude"
    fill_in 'Email', with: "bob@example.com"
    fill_in 'Company', with: "Indian Line Farm"
    fill_in 'Address', with: "221B Baker St"
    fill_in 'City', with: "Great Barrington"
    fill_in 'State', with: "MA"
    fill_in 'Zip Code', with: "01230"

    fill_in "Password", with: "iamapassword"
    fill_in "Confirm Password", with: "imnotapassword?"

    click_button "Sign Up"

    expect(page).to have_content("match")
  end
end
