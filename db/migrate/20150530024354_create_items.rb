class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :unit_cost
      t.decimal :unit_price
      t.references :restaurant, index: true
      t.references :item_category, index: true
      t.references :food_category, index: true
      t.references :object_type, index: true

      t.timestamps
    end
  end
end
