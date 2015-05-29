class CreateLocalDeliveries < ActiveRecord::Migration
  def change
    create_table :local_deliveries do |t|
      t.time :start_time
      t.time :end_time
      t.references :local, index: true
      t.references :district, index: true

      t.timestamps
    end
  end
end
