require 'spec_helper'

feature 'user visits event show page' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:event) { FactoryGirl.create(:event, user: user2) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:user_event) { UserEvent.create(grower: user, event: event) }

  scenario 'user visits event page' do
    visit event_path(event)

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
    login_as(user2, scope: :user)
    visit event_path(event)

    click_button "Attending"

    expect(page).to have_link(user.company)
  end

  scenario 'if user is not signed in, they will not see button to attend' do
    visit event_path(event)

    expect(page).to_not have_button("Attending")
  end

  scenario 'if user says they are attending, the button is replaced with "Not Attending"' do
    login_as(user2, scope: :user)
    visit event_path(event)
    click_button "Attending"

    expect(page).to have_button("Not Attending")
  end

  scenario 'user clicks "Not Attending"' do
    login_as(user2, scope: :user)
    visit event_path(event)

    click_button "Attending"
    click_button "Not Attending"

    expect(page).to have_button("Attending")
  end
end
