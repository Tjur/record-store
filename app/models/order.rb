class Order < ActiveRecord::Base
  belongs_to :user
  serialize :products, Hash

  validates :total, presence: true

  enum status: [ :anulowane, :przyjęty_do_realizacji, :wysłane, :oczekuje_na_wpłatę ]
end
