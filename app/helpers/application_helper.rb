module ApplicationHelper

  def initialize_basket
    basket = Basket.create
    session[:basket_id] = basket.id
  end
end
