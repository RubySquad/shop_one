require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

	

	it_renders_404_page_when_product_is_not_found :show, :edit, :update, :destroy

	describe "show action" do
		it "renders show template if a product is found" do
			product = create(:product)
			get :show, {id: product.id}
			response.should render_template('show')
		end
	end	

	describe "create action" do
		it "redirect to product page if validations pass" do
			post :create, product: {name: "Product 1", price: 10, count: 1}
			response.should redirect_to(product_path(assigns(:item)))
		end

		it "renders new page again if validations fail" do
			post :create, product: {name: "Product 1", price: 0, count: 0}
			response.should render_template('new')
		end
	end

#		describe "destroy action" do
#			it 'redirects to index action when a product is destroyed succesfully' do
#				product = create(:product)
#				delete :destroy, id: product.id
#				response.should redirect_to(product_path)
#			end
#		end

		before(:each) do
  		@product = create(:product)
		end

		describe "update action" do
  		let(:attr) do 
    	{ :name => 'new product', :price => 20.0, :count => 2}
  		end

  		before(:each) do
   			put :update, :id => @product.id, :product => attr
    		@product.reload
  		end

  		it { expect(response).to redirect_to(product_path(assigns(:item))) }
  		it { expect(@product.name).to eql attr[:name] }
  		it { expect(@product.price).to eql attr[:price] }
  		it { expect(@product.count).to eql attr[:count] }
		end

end
