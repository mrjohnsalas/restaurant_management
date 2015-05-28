class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :phone_1
      t.string :phone_2
      t.string :email_1
      t.string :email_2
      t.string :web_page
      t.string :facebook
      t.string :twitter
      t.string :instagram
      t.boolean :allow_point
      t.integer :min_points
      t.references :user, index: true
      t.references :object_type, index: true

      t.timestamps
    end
  end
end
