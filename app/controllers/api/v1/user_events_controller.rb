class Api::V1::UserEventsController < ApplicationController
  def index
    @attendees = UserEvent.all
    render json: @attendees
  end
end
