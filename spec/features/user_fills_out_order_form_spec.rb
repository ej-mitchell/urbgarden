require 'rails_helper'

feature 'site visitor makes an order' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:event) { FactoryGirl.create(:event, user: user) }
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
  
  scenario 'site visitor fills out first part of order form' do
    visit user_path(user)
    click_link "Make an order!"
    
    fill_in "Name", with: "Bob"
    fill_in "Email", with: "bobsaget@email.com"
    find("##{event.id}").click
    click_button "Continue to Order"
    
    expect(page).to have_content("Order Continued")
  end
  
  scenario 'site visitor fills out second part of order form' do
    visit user_path(user)
    click_link "Make an order!"
    
    fill_in "Name", with: "Bob"
    fill_in "Email", with: "bobsaget@email.com"
    find("##{event.id}").click
    click_button "Continue to Order"
    
    fill_in "Quantity", with: "2"
    click_button "Add to Cart"
    expect(page).to have_content("2")
  end
  
  scenario 'site visitor sends order' do
    visit user_path(user)
    click_link "Make an order!"
    
    fill_in "Name", with: "Bob"
    fill_in "Email", with: "bobsaget@email.com"
    find("##{event.id}").click
    click_button "Continue to Order"
    
    fill_in "Quantity", with: "2"
    click_button "Add to Cart"
    click_button "I'm done"
    
    expect(page).to have_content("sent")
  end
  
  scenario 'site visitor cancels order' do
    visit user_path(user)
    click_link "Make an order!"
    
    fill_in "Name", with: "Bob"
    fill_in "Email", with: "bobsaget@email.com"
    find("##{event.id}").click
    click_button "Continue to Order"
    
    click_button "Cancel"
    expect(page).to have_content("deleted")
  end
  
  scenario 'site visitor edits order details' do
    visit user_path(user)
    click_link "Make an order!"
    
    fill_in "Name", with: "Bob"
    fill_in "Email", with: "bobsaget@email.com"
    find("##{event.id}").click
    click_button "Continue to Order"
    
    click_button "Edit Order Info"
    
    expect(page).to have_content("Edit Order")
    
    fill_in "Name", with: "Jill"
    find("##{event.id}").click
    click_button "Continue to Order"
    expect(page).to have_content("Order Continued")
    expect(page).to have_content("Jill")
  end
  
  scenario 'site visitor edits quantity details' do
    visit user_path(user)
    click_link "Make an order!"
    
    fill_in "Name", with: "Bob"
    fill_in "Email", with: "bobsaget@email.com"
    find("##{event.id}").click
    click_button "Continue to Order"
    
    fill_in "Quantity", with: "2"
    click_button "Add to Cart"
    click_button "Edit"
    
    expect(page).to have_content(product.name)
    fill_in "Quantity", with: "1"
    click_button "Add to Cart"
    
    expect(page).to have_content("1")
  end
  
  scenario 'site visitor deletes product from list' do
    visit user_path(user)
    click_link "Make an order!"
    
    fill_in "Name", with: "Bob"
    fill_in "Email", with: "bobsaget@email.com"
    find("##{event.id}").click
    click_button "Continue to Order"
    
    fill_in "Quantity", with: "2"
    click_button "Add to Cart"
    click_button "Delete"
    
    expect(page).to_not have_content("2")
  end
  
end