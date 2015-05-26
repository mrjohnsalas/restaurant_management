class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :name
      t.references :province, index: true

      t.timestamps
    end
  end
end
