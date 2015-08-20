require 'rails_helper'

RSpec.describe MainController, type: :controller do


  describe "GET #index" do
  	login_user
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
      subject.current_user.should_not be_nil
    end
  end

end
