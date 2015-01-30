class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :name
      t.references :artist, index: true
      t.references :genre, index: true
      t.integer :release_year
      t.decimal :price

      t.timestamps
    end
  end
end
