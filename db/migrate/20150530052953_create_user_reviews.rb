class CreateUserReviews < ActiveRecord::Migration
  def change
    create_table :user_reviews do |t|
      t.integer :rating
      t.text :comment
      t.integer :object_id
      t.references :user, index: true
      t.references :object_type, index: true

      t.timestamps
    end
  end
end
