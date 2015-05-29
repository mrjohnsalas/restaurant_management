class CreateLocalPhotos < ActiveRecord::Migration
  def change
    create_table :local_photos do |t|
      t.integer :index
      t.references :local, index: true

      t.timestamps
    end
  end
end
