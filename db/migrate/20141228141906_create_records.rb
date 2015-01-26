class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :name
      t.decimal :price
      t.references :artist, index: true
      t.references :genre, index: true
      t.integer :release_date

      t.timestamps
    end
  end
end
