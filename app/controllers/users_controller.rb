class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @events = UserEvent.where(grower_id: params[:id])
    @products = Product.where(grower_id: params[:id])
  end
end
