class CreateReservations < ActiveRecord::Migration[6.1]

  def change
    create_table :reservations do |t|
      t.date :checkin
      t.date :checkout
      t.integer :person
      t.date :correct_day
      t.references :user, foreign_key: true
      t.references :room

      t.timestamps
    end
  end
end
