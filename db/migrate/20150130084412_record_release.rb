class RecordRelease < ActiveRecord::Migration
  def change
  end

  def self.up
    add_column :records, :release_year, :integer
  end
end
