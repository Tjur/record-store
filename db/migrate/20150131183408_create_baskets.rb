class CreateBaskets < ActiveRecord::Migration
  def change
    create_table :baskets do |t|
      t.text :products

      t.timestamps
    end
  end
end
