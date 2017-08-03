class Api::V1::EventsController < ApplicationController
  def index
    @events = Event.order("created_at DESC").all
    render json: @events
  end
end
