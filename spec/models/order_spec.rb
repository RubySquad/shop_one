require 'rails_helper'

RSpec.describe Order, type: :model do
  before { @order = Order.new }

  subject { @order }

  it { should respond_to(:product) }
  it { should respond_to(:user) }
  it { should respond_to(:count) }
  it { should respond_to(:status) }
end
