class BasketsController < ApplicationController
  helper_method :remove_product

  def new
    @basket = Basket.new(params[:id])
  end

  def create
    @basket = Basket.new(params[:id])
    @basket.save!
  end

  def show
    @basket = Basket.find(session[:basket_id])
  end

  def remove_product
    basket = Basket.find(session[:basket_id])
    record = Record.find(params[:record_id])
    basket.update(products: basket.products.except(record))
    redirect_to show_basket_path(basket)
  end
end
