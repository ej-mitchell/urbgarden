class ProductOrdersController < ApplicationController
  def new
    @product_order = ProductOrder.new
    @order = Order.find(params[:order_id])
    @user = @order.user
    @products = Product.where(grower_id: @user.id)
    @purchased = ProductOrder.where(order: @order)
  end

  def create
    @product_order = ProductOrder.new(product_order_params)

    @order = Order.find(params[:order_id])
    @user = @order.user
    @products = Product.where(grower_id: @user.id)
    @purchased = ProductOrder.where(order: @order)

    if @product_order.save
      flash[:notice] = "Successfully added to cart!"
      redirect_to new_order_product_order_path(@order)
    else
      flash[:notice] = "Please review the error messages."
      render :new
    end
  end

  def edit
    @product_order = ProductOrder.find(params[:id])
    @order = Order.find(params[:order_id])
    @user = @order.user
    @products = Product.where(grower_id: @user.id)
    @purchased = ProductOrder.where(order: @order)
  end

  def update
    @product_order = ProductOrder.find(params[:id])
    @order = Order.find(params[:order_id])
    @user = @order.user
    @products = Product.where(grower_id: @user.id)
    @purchased = ProductOrder.where(order: @order)
    if @product_order.update_attributes(product_order_params)
      flash[:notice] = 'Order was successfully updated.'
      redirect_to new_order_product_order_path(@order)
    else
      flash[:alert] = 'Please check the errors for your order.'
      render action: 'edit'
    end
  end

  def destroy
    @product_order = ProductOrder.find(params[:id])
    @order = Order.find(params[:order_id])
    @user = @order.user
    @products = Product.where(grower_id: @user.id)
    @purchased = ProductOrder.where(order: @order)

    if @product_order.destroy!
      flash[:notice] = "Item deleted from order."
      render :new
    end
  end

  private

  def product_order_params
    params.require(:product_order).permit(:product_id, :quantity).merge(order: Order.find(params[:order_id]))
  end



end
