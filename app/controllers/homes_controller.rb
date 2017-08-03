class HomesController < ApplicationController
  def index
    @home = "Welcome to UrbGarden! Buy local; sell local."
    @event_title = "Upcoming Events:"
    @events = Event.all
    if user_signed_in?
      @user = current_user
      @user_pic = current_user.avatar
    end
  end
end
