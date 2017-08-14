class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    
    @user_events = UserEvent.where(grower_id: params[:id])
    @events = []
    @user_events.each do |event|
      @events << event.event
    end
    
    @user_created = Event.where(user_id: params[:id])
    @user_created.each do |event|
      @events << event
    end
    
    @products = Product.where(grower_id: params[:id])
  end
end
