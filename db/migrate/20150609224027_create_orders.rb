class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :order_date
      t.decimal :total_discount, precision: 19, scale: 6
      t.decimal :sub_total, precision: 19, scale: 6
      t.decimal :igv, precision: 19, scale: 6
      t.decimal :total, precision: 19, scale: 6
      t.references :local, index: true
      t.references :user, index: true
      t.references :payment_type, index: true

      t.timestamps
    end
  end
end
