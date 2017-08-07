class Api::V1::EventsController < ApplicationController

  def index
    @events = Event.order("updated_at DESC").all
    render json: @events
  end

  def show
    @event = Event.find(params[:id])
    render json: @event, serializer: EventSerializer
  end


end
