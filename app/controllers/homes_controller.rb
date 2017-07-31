class HomesController < ApplicationController
  def index
    @home = "Welcome to UrbGarden! Buy local; sell local."
    @event_title = "Upcoming Events:"
    @events = Event.all
  end
end
