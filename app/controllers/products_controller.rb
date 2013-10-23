class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def create
		@product = Product.new product_params
		if @product.save
			redirect_to product_path(@product)
		else
			render 'new'
		end
	end	

	def new
		@product = Product.new
	end

	def product_params
		params.require(:product).permit :name, :description, :price, :product_image
	end

	def show
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update product_params
			redirect_to @product
		else
			render 'edit'
		end
	end

	def destroy
		@product = Product.find(params[:id])
		Product.destroy(@product)
		flash.now[:notice]
		redirect_to '/'
	end

end
