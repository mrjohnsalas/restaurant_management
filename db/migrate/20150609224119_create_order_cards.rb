class CreateOrderCards < ActiveRecord::Migration
  def change
    create_table :order_cards do |t|
      t.references :order, index: true
      t.references :user_card, index: true

      t.timestamps
    end
  end
end
