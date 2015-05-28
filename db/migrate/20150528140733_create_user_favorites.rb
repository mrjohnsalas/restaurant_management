class CreateUserFavorites < ActiveRecord::Migration
  def change
    create_table :user_favorites do |t|
      t.references :user, index: true
      t.references :object_type, index: true

      t.timestamps
    end
  end
end
