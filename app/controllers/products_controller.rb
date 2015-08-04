# Product RESTfull controller
class ProductsController < ApplicationController

	# output list of Products
	def index
		@items = Product.all
	end

	# output single Product by ID
	def show
		unless @item = Product.where(id: params[:id]).first
			render text: "Page not found", status: 404
		end
	end

	# form output for Product creation
	def new
		@item = Product.new
	end

	# create Product record at database
	def create
		@item = Product.create(product_params)
		if @item.errors.empty?
			redirect_to product_path(@item)
		else
			render "new"
		end
	end

	# form output for Product creation
	def edit
		@item = Product.find(params[:id])
	end

	# create Product record at database
	def update
		@item = Product.find(params[:id])
		@item.update_attributes(product_params)
		if @item.errors.empty?
			redirect_to product_path(@item)
		else
			render "edit"
		end
	end

	def destroy
		@item = Product.find(params[:id])
		@item.destroy
		redirect_to action: "index"
	end

	private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def product_params
      params.require(:product).permit(:name, :price, :count)
    end
end
