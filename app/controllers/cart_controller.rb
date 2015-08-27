# Cart controller
class CartController < ApplicationController
  def index
    authorize! :index, :cart
    if session[:cart]
      @cart = session[:cart]
    else
      @cart = {}
    end
  end

  def add
    authorize! :add, :cart
    id = params[:id]
    session[:cart] ||= {}
    cart = session[:cart]
    if cart[id]
      cart[id] += 1
    else
      cart[id] = 1
    end
    redirect_to action: :index
  end

  def clear_cart
    authorize! :clear_cart, :cart
    session[:cart] = nil
    redirect_to action: :index
  end

  def self.get_products_count session
    if session[:cart]
      count = 0;
      session[:cart].each_value{|val| count+=val};
      count;
    else
      0
    end
  end
end
