class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.integer :shift_id
      t.time :reservation_time
      t.integer :guest_id
      t.integer :guest_count
      t.integer :dining_table_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
