class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.decimal :total, precision: 5, scale: 2
      t.text :products
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
