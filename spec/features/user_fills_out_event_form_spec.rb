require 'rails_helper'

feature 'user adds a new event' do
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'authenticated user sees add event link' do
    login_as(user, scope: :user)
    visit root_path
    expect(page).to have_link("Add Event")
  end

  scenario 'unauthenticated user cannot see add event link button' do
    visit root_path
    expect(page).to_not have_link("Add Event")
  end

  scenario 'authenticated user navigates to new event form' do
    login_as(user, scope: :user)
    visit root_path
    click_link "Add Event"

    expect(page).to have_content("Add New Event")
  end

  scenario 'authenticated user fills out new event form' do
    login_as(user, scope: :user)
    visit root_path
    click_link "Add Event"

    fill_in "Name", with: "I'm new!"
    fill_in "Description", with: "Such wow. So event."
    fill_in "Address", with: "221 B Baker St"
    fill_in "City", with: "Boston"
    select "MA", from: "State"
    fill_in "Event URL", with: "http://www.google.com"
    fill_in "Map URL", with: "http://www.maps.google.com"
    select_date_and_time(DateTime.now, from: :event_start_time)
    select_date_and_time(DateTime.new(2017,07,31,4,5,6), from: :event_end_time)

    click_button "Add Event"
    expect(page).to have_content("Event created!")
  end

  scenario 'authenticated user fills out form incorrectly' do
    login_as(user, scope: :user)
    visit root_path
    click_link "Add Event"

    click_button "Add Event"
    expect(page).to have_content("can't be blank")
  end

  def select_date_and_time(date, options = {})
    field = options[:from]
    select date.strftime('%Y'), :from => "#{field}_1i" #year
    select date.strftime('%B'), :from => "#{field}_2i" #month
    select date.strftime('%d'), :from => "#{field}_3i" #day
    select date.strftime('%I %p'), :from => "#{field}_4i" #hour
    select date.strftime('%M'), :from => "#{field}_5i" #minute
  end
end
