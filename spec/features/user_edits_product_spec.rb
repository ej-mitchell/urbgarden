require 'rails_helper'

feature 'user edits product' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:product) { FactoryGirl.create(:product, grower: user) }

  scenario 'user visits their profile page and sees edit/delete' do
    login_as(user, scope: :user)
    visit user_path(user)

    expect(page).to have_button("Edit")
    expect(page).to have_button("Delete")
  end

  scenario 'another user cannot see those buttons when not their profile' do
    login_as(user, scope: :user)
    visit user_path(user2)

    expect(page).to_not have_button("Edit")
    expect(page).to_not have_button("Delete")
  end

  scenario 'another user cannot just bypass the lack of buttons with url' do
    login_as(user2, scope: :user2)
    visit edit_product_path(product)

    expect(page).to have_content("You cannot edit other people's products.")
  end

  scenario 'user clicks edit' do
    login_as(user, scope: :user)
    visit user_path(user)
    click_button "Edit"

    expect(page).to have_content("Edit Product")
  end

  scenario 'user edits product' do
    login_as(user, scope: :user)
    visit user_path(user)
    click_button "Edit"

    fill_in "Unit", with: "half dozen"
    click_button "Add Product"

    expect(page).to have_content(user.company)
    expect(page).to have_content("half dozen")
  end

  scenario 'user deletes product' do
    login_as(user, scope: :user)
    visit user_path(user)
    click_button "Delete"

    expect(page).to_not have_content(product.name)
  end
end
