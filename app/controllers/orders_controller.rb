class OrdersController < ApplicationController
  before_action :authorize

  def new
  end

  def create
    @order =  Order.new(user: current_user, total: params[:total], products: params[:products])
    basket_id = session[:basket_id]
    session[:basket_id] = nil
    if @order.save!
      redirect_to root_path, notice: 'Zamówienie nr #{basket_id} przyjęto do realizacji'
    else 
      redirect_to root_path, notice: 'Nie udało się'
    end
  end

end
