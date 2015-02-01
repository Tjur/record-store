class Order < ActiveRecord::Base
  belongs_to :user
  serialize :products, Hash

  validates :total, presence: true

  enum status: [ :anulowane, :przyjęte_do_realizacji, :w_trakcie_realizacji, :wysłane ]
end
