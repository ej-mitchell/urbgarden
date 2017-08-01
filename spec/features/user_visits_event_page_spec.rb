require 'spec_helper'

feature 'user visits event show page' do
  let!(:event) { FactoryGirl.create(:event) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:user_event) { UserEvent.create(grower: user, event: event) }

  scenario 'user clicks on event' do
    visit root_path
    click_link event.name

    expect(page).to have_content(event.name)
    expect(page).to have_content("Attendees")
    expect(page).to have_link(user.company)
  end

  scenario 'user clicks company link and is brought to user show page' do
    visit event_path(event)
    click_link user.company

    expect(page).to have_content(user.company)
  end

  scenario 'authenticated user clicks attending button and is added to the attendees list' do
    login_as(user2, scope: :user2)
    visit event_path(event)

    click_button "Attending"

    expect(page).to have_link(user2.company)
  end
end
