class EventsController < ApplicationController
  def index
    @events = Event.all

    if !Event.search(params[:search]).empty?
      @events = Event.search(params[:search]).order("created_at DESC")
    else
      flash[:notice] = "Sorry that event doesn't exist. Peruse these instead!"
      @events = Event.all.order("created_at DESC")
    end
  end

  def show
    @event = Event.find(params[:id])
    @attendees = UserEvent.where(event_id: params[:id])
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

  def edit
    @event = Event.find(params[:id])
    @state_collection = Event::STATES
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:notice] = 'Event was successfully updated.'
      redirect_to event_path(@event)
    else
      render action: 'edit'
      @state_collection = Event::STATES
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy!
      redirect_to root_path
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
    ).merge(user: current_user)
  end
end
