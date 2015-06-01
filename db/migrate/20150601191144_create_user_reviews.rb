class CreateUserReviews < ActiveRecord::Migration
  def change
    create_table :user_reviews do |t|
      t.integer :rating
      t.text :comment
      t.integer :object_type_id
      t.references :user, index: true
      t.references :item, index: true
      t.references :restaurant, index: true

      t.timestamps
    end
  end
end
