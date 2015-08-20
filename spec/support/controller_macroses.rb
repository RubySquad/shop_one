module ControllerMacros

  def self.included(base)
      base.extend(ClassMethods)
  end

  module ClassMethods
    def it_renders_404_page_when_product_is_not_found(*actions)
      actions.each do |a|
      it " #{a} renders 404 page when product is not found" do
        verb = if a == :update
          "PATCH"
          elsif a == :destroy
          "DELETE"
          else "GET"
          end
          process a, verb, {id: 0}
          expect(response.status).to equal(404)
    end
  end

   end

   
  end

def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in create(:admin_user) # Using factory girl as an example
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = create(:user)
      user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in user
    end
  end


end