class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  def show
    @cart = @current_cart
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end
end
