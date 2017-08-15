class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @product_orders = ProductOrder.where(order: @order)
  end

  def new
    @order = Order.new
    @grower = User.find(params[:user_id])
    @events_list = UserEvent.where(grower_id: params[:user_id])
    @events = []
    @events_list.each do |user_event|
      @events << user_event.event
    end
    @user_created = Event.where(user_id: params[:user_id])
    @user_created.each do |event|
      @events << event
    end
  end

  def create
    @order = Order.new(order_params)
    @grower = User.find(params[:user_id])
    @events_list = UserEvent.where(grower_id: params[:user_id])
    @events = []
    @events_list.each do |user_event|
      @events << user_event.event
    end
    @user_created = Event.where(user_id: params[:user_id])
    @user_created.each do |event|
      @events << event
    end
    if @order.save
      flash[:notice] = "Order started!"
      redirect_to new_order_product_order_path(@order)
    else
      flash[:alert] = "Order not created; please review form."
      render :new
    end
  end

  def edit
    @order = Order.find(params[:id])
    @grower = @order.user
    @events_list = UserEvent.where(grower: @grower)
    @events = []
    @events_list.each do |user_event|
      @events << user_event.event
    end
    @user_created = Event.where(user: @grower)
    @user_created.each do |event|
      @events << event
    end
  end

  def update
    @order = Order.find(params[:id])
    @grower = @order.user
    @product_orders = ProductOrder.where(order: @order)
    @events_list = UserEvent.where(grower: @grower)
    @events = []
    @events_list.each do |user_event|
      @events << user_event.event
    end
    @user_created = Event.where(user: @grower)
    @user_created.each do |event|
      @events << event
    end
    if @order.update_attributes(order_params)
      flash[:notice] = 'Order was successfully updated.'
      redirect_to new_order_product_order_path(@order)
    else
      flash[:alert] = 'Please check the errors for your order.'
      render action: 'edit'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    if @order.destroy!
      flash[:notice] = "Order deleted."
      redirect_to root_path
    end
  end

  def send_order_mail
    @order = Order.find(params[:order_id])
    @client = @order.email
    @vendor = @order.user.email
    UserMailer.order_email(@vendor, @client, @order).deliver_now
    flash[:notice] = "Order has been sent."
    redirect_to order_path(@order)
  end

  private
  def order_params
    params.require(:order).permit(:name, :email).merge(user: User.find(params[:user_id]), event: Event.find_by(name: params[:order][:event]))
  end
end
