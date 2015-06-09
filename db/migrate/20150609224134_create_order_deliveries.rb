class CreateOrderDeliveries < ActiveRecord::Migration
  def change
    create_table :order_deliveries do |t|
      t.references :order, index: true
      t.references :user_address, index: true

      t.timestamps
    end
  end
end
