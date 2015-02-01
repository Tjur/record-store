class BasketsController < ApplicationController

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
end
