require 'rails_helper'

describe "user registration" do
  it "allows new users to register with an email address and password" do
    visit "/users/sign_up"

    fill_in "Email",                 :with => "sample@example.com"
    fill_in "Password",              :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_button "Sign up"

  end
end