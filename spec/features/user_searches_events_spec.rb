require 'rails_helper'
require 'spec_helper'

feature 'user uses the search bar' do

  let!(:event) { FactoryGirl.create(:event) }

  scenario 'search bar is present' do
    visit root_path
    expect(page).to have_button("Search")
  end

  scenario 'user searches a city' do
    visit root_path
    within("#search-form") do
      fill_in 'search', with: event.city
    end
    click_button "Search"

    expect(page).to have_content(event.city)
    expect(page).to have_content(event.name)
  end

  scenario 'user searches a state' do
    visit root_path
    fill_in 'search', with: event.state
    click_button "Search"

    expect(page).to have_content(event.state)
    expect(page).to have_content(event.name)
  end

  scenario 'user searches an event name' do
    visit root_path
    fill_in 'search', with: event.name
    click_button "Search"

    expect(page).to have_content(event.state)
    expect(page).to have_content(event.name)
  end

  scenario 'user searches an event detail that does not exist' do
    visit root_path
    fill_in 'search', with: "Bob Saget"
    click_button "Search"

    expect(page).to have_content("doesn't exist")
  end

end
