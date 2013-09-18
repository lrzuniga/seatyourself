class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :restaurant_id
      t.integer :diner_id
      t.integer :party_size
      t.datetime :time

      t.timestamps
    end
  end
end
