class CreateAbouts < ActiveRecord::Migration
  def change
    create_table :abouts do |t|
      t.text :history
      t.text :mision
      t.text :vision

      t.timestamps
    end
  end
end
