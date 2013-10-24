class CartsController < ApplicationController

	def update
      product = Product.find params[:cart][:product_id]
  		current_cart.products << product

  		redirect_to product_path(product)
  end

  def remove_item
      render :text => params.inspect
      # product = Product.find params[:product_id]
      # current_cart.products.delete(product)
      # flash.notice = "Product #{product.name} removed from cart"
      # render 'show'
	end

	def show
		@cart = current_cart.products
	end
	
  def destroy
    # flash[:notice] = "Product: #{@product.name} removed from cart"
    redirect_to '/'
  end
end
