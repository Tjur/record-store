class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :firstname
      t.string :lastname
      t.text :orders_id
      t.string :password_digest

      t.timestamps
    end
  end
end
