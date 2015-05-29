class CreateLocals < ActiveRecord::Migration
  def change
    create_table :locals do |t|
      t.string :name
      t.string :phone_1
      t.string :phone_2
      t.string :email_1
      t.string :email_2
      t.text :description
      t.boolean :allow_delivery
      t.boolean :allow_parking
      t.boolean :allow_reservation
      t.boolean :allow_credit_card
      t.references :restaurant, index: true
      t.references :district, index: true

      t.timestamps
    end
  end
end
