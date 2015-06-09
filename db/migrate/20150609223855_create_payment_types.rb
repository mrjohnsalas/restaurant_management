class CreatePaymentTypes < ActiveRecord::Migration
  def change
    create_table :payment_types do |t|
      t.string :name
      t.decimal :discount, precision: 19, scale: 6

      t.timestamps
    end
  end
end
