class ChangeCostPriceItems < ActiveRecord::Migration
  def self.up
    change_column :items, :unit_cost, :decimal, :precision => 19, :scale => 6
  end
end
