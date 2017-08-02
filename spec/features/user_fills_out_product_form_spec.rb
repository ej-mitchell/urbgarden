require 'rails_helper'

feature 'user adds a new product to their page' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }

  scenario 'authenticated user sees add product link' do
    login_as(user, scope: :user)
    visit user_path(user)
    expect(page).to have_link("Add new product")
  end

  scenario 'unauthenticated user cannot see add event link button' do
    visit user_path(user)
    expect(page).to_not have_link("Add new product")
  end

  scenario 'another user will not see a new product link on another\'s page' do
    login_as(user, scope: :user)
    visit user_path(user2)
    expect(page).to_not have_link("Add new product")
  end

  scenario 'authenticated user navigates to new event form' do
    login_as(user, scope: :user)
    visit user_path(user)
    click_link "Add new product"

    expect(page).to have_content("Add a new product")
  end

  scenario 'authenticated user fills out new event form' do
    login_as(user, scope: :user)
    visit user_path(user)
    click_link "Add new product"

    fill_in "Name", with: "Zukes"
    fill_in "Price", with: "6.99"
    fill_in "Unit", with: "half dozen"
    click_button "Add Product"
    expect(page).to have_content("Product added!")
  end

  scenario 'authenticated user fills out form incorrectly' do
    login_as(user, scope: :user)
    visit user_path(user)
    click_link "Add new product"

    click_button "Add Product"
    expect(page).to have_content("can't be blank")
  end

  scenario 'alter user cannot be sneaky' do
    login_as(user, scope: :user)
    visit new_user_product_path(user2)

    expect(page).to have_content("You can only add products to your own page!")
  end


end
