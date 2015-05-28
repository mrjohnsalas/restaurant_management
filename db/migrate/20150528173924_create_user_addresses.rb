class CreateUserAddresses < ActiveRecord::Migration
  def change
    create_table :user_addresses do |t|
      t.string :name
      t.string :address
      t.boolean :is_default
      t.references :district, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
