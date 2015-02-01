class Basket < ActiveRecord::Base
  belongs_to :user
  serialize :products, Hash

  def add(record)
    unless products[record]
      products[record] = 1
    else
      products[record] += 1
    end
    products
  end
end
