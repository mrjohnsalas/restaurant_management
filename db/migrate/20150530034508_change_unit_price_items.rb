class ChangeUnitPriceItems < ActiveRecord::Migration
  def self.up
    change_column :items, :unit_price, :decimal, :precision => 19, :scale => 6
  end
end
