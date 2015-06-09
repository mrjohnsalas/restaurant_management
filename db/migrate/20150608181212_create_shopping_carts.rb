class CreateShoppingCarts < ActiveRecord::Migration
  def change
    create_table :shopping_carts do |t|
      t.integer :quantity
      t.references :menu, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
