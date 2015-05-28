class AddObjectIdToUserFavorites < ActiveRecord::Migration
  def change
    add_column :user_favorites, :object_id, :integer
  end
end
