class AddStandardBooleanToCard < ActiveRecord::Migration
  def self.up
    add_column :cards, :standard, :boolean
  end

  def self.down
    remove_column :cards, :standard
  end
end
