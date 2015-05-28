class CreateUserPoints < ActiveRecord::Migration
  def change
    create_table :user_points do |t|
      t.integer :quantity
      t.references :restaurant, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
