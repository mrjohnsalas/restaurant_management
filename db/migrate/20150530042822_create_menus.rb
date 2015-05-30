class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.date :menu_date
      t.integer :stock
      t.references :local, index: true
      t.references :item, index: true

      t.timestamps
    end
  end
end
