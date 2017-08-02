class ProductsController < ApplicationController
  def new
    @product = Product.new
    @user = User.find(params[:user_id])
  end

  def create
    @product = Product.new(product_params)
    @user = User.find(params[:user_id])
    if @product.save
      flash[:notice] = "Product added!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "Product not created; please review error messages below."
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :unit).merge(grower: User.find(params[:user_id]))
  end
end
