class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @state_collection = Event::STATES
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      flash[:notice] = "Event created!"
      redirect_to event_path(@event.id)
    else
      flash[:alert] = "Event not created; please review form."
      @state_collection = Event::STATES
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :name,
      :description,
      :start_time,
      :end_time,
      :address,
      :city,
      :state,
      :event_url,
      :map_url
    )
  end
end
