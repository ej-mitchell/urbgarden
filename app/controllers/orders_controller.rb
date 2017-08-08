class OrdersController < ApplicationController
  def new
    @order = Order.new
    @grower = User.find(params[:user_id])
    @products_list = Product.where(grower_id: params[:user_id])
    @products_list.length.times do
      @product_order = @order.product_orders.build
    end
    @events_list = UserEvent.where(grower_id: params[:user_id])
    @events = []
    @events_list.each do |user_event|
      @events << user_event.event
    end
  end

  def create

  end

  def show
  end

  def index
  end

  private


  def order_params
    params.require(:order).permit(:name, :email).merge(user: User.find(params[:user_id]))
  end
end
