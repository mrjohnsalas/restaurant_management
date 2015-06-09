class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.integer :quantity
      t.decimal :unit_price, precision: 19, scale: 6
      t.decimal :total, precision: 19, scale: 6
      t.references :order, index: true
      t.references :menu, index: true

      t.timestamps
    end
  end
end
