require 'rails_helper'

RSpec.describe User, type: :model do
  before { @user = create(:user) }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:surname) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:role) }

  
end
