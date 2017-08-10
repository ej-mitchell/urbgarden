class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @grower = User.find(params[:user_id])
    @events_list = UserEvent.where(grower_id: params[:user_id])
    @events = []
    @events_list.each do |user_event|
      @events << user_event.event
    end
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      flash[:notice] = "Order started!"
      redirect_to new_order_product_order_path(@order)
    else
      flash[:alert] = "Order not created; please review form."
      render :new
    end
  end

  def destroy
    @order = Order.find(params[:id])
    if @order.destroy!
      flash[:notice] = "Order deleted."
      redirect_to root_path
    end
  end

  private


  def order_params
    params.require(:order).permit(:name, :email).merge(user: User.find(params[:user_id]), event: Event.find_by(name: params[:order][:event]))
  end
end
