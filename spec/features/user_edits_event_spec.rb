require 'rails_helper'

feature 'user edits product' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:event) { FactoryGirl.create(:event, user: user) }

  scenario 'user visits the event page and sees edit/delete' do
    login_as(user, scope: :user)
    visit event_path(event)

    expect(page).to have_button("Edit")
    expect(page).to have_button("Delete")
  end

  scenario 'another user cannot see those buttons when not their profile' do
    login_as(user2, scope: :user2)
    visit event_path(event)

    expect(page).to_not have_button("Edit")
    expect(page).to_not have_button("Delete")
  end

  scenario 'another user cannot just bypass the lack of buttons with url' do
    login_as(user2, scope: :user2)
    visit edit_event_path(event)

    expect(page).to have_content("You cannot edit an event you didn't create!")
  end

  scenario 'user clicks edit' do
    login_as(user, scope: :user)
    visit event_path(event)
    click_button "Edit"

    expect(page).to have_content("Edit Event")
  end

  scenario 'user edits event' do
    login_as(user, scope: :user)
    visit event_path(event)
    click_button "Edit"

    fill_in "Name", with: "Oi VEY"
    click_button "Add Event"

    expect(page).to have_content(user.company)
    expect(page).to have_content("Oi VEY")
  end

  scenario 'user deletes event' do
    login_as(user, scope: :user)
    visit event_path(event)
    click_button "Delete"

    expect(page).to_not have_content(event.name)
  end
end
