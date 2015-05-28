class CreateUserCards < ActiveRecord::Migration
  def change
    create_table :user_cards do |t|
      t.string :card_number
      t.boolean :is_default
      t.references :credit_card_type, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
