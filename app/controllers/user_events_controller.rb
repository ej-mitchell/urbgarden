class UserEventsController < ApplicationController

  def create
    @user_event = UserEvent.new(event_id: params[:event_id],
      grower_id: params[:grower_id])
    @user_event.save
    redirect_to event_path(@user_event.event)
  end
end
