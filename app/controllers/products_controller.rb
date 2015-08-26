# Product RESTfull controller
class ProductsController < ApplicationController

  ROOT_ID = 1
  authorize_resource

	before_filter :find_product, only: [:show, :edit, :update, :destroy]
  before_filter :fill_filters_array, only: [:new, :edit]

	# output list of Products
	def index
    category = params[:category]
    category = category == nil ? ROOT_ID : category.to_i

    current_category = Category.find(category)

    # Create an array of nearest childs of current_category
    @categories = current_category.categories

    # Create ancestors path
    @category_seq = [current_category]
    until @category_seq.first.id == ROOT_ID
      @category_seq.unshift( @category_seq[0].category )
    end

    # Create an array of all childs
    subcategories = get_subc(current_category)

    # Create an array of all products which belongs to current_category
    @items = current_category.products.to_a

    subcategories.each do |c|
      c.products.each { |p| @items.push p }
    end

    @items = Kaminari.paginate_array(@items).page(params[:page]).per(7)

    respond_to do |format|
      format.html
      format.js {}
    end

	end

	# output single Product by ID
	def show
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
	end

	# create Product record at database
	def update
		@item.update_attributes(product_params)
		if @item.errors.empty?
			redirect_to product_path(@item)
		else
			render "edit"
		end
	end

	def destroy
		@item.destroy
		redirect_to action: "index"
	end

	private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def product_params
      params.require(:product).permit(:name, :price, :count, :image, :category_id)
    end

    def find_product
    	@item = Product.where(id: params[:id]).first
    	render_404 unless @item
    end

    def fill_filters_array
      @category_array = Category.all.map {|el| [el.name, el.id]} 
      @producer_array = Producer.all.map {|el| [el.name, el.id]} 
      @retailer_array = Retailer.all.map {|el| [el.name, el.id]} 
    end

    # Selects all subcategories which are childs of category parametr
    def get_subc(category)
    retval = []
    #Category.where(category_id: category.id).each do |c| 
    category.categories.each do |c| 
      retval += [c] + get_subc(c)
    end
    retval
  end
end