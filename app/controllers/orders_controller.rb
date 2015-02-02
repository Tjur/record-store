class OrdersController < ApplicationController
  before_action :authorize

  def index
    @orders = Order.where(user_id: current_user)
  end

  def create
    @order =  Order.new(user: current_user, total: params[:total], products: params[:products])
    session[:basket_id] = nil
    if @order.save!
      redirect_to root_path, notice: "Przyjęto zamówienie nr #{@order.id}"
    else 
      redirect_to root_path, notice: 'Nie udało się'
    end
  end

  def show
  end

end
