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

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @user = @product.grower
    if @product.update_attributes(product_params_edit)
      flash[:notice] = 'Product was successfully updated.'
      redirect_to user_path(@user)
    else
      render action: 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @user = @product.grower
    if @product.destroy!
      redirect_to user_path(@user)
    end
  end

  private

  def product_params_edit
    @product = Product.find(params[:id])
    params.require(:product).permit(:name, :price, :unit)
      .merge(grower: @product.grower)
  end

  def product_params
    params.require(:product).permit(:name, :price,:unit)
      .merge(grower: User.find(params[:user_id]))
  end
end
