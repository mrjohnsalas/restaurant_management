class CreateLocalCards < ActiveRecord::Migration
  def change
    create_table :local_cards do |t|
      t.references :local, index: true
      t.references :credit_card_type, index: true

      t.timestamps
    end
  end
end
