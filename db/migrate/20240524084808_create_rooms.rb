class CreateRooms < ActiveRecord::Migration[6.1]

  def change
    create_table :rooms do |t|
      t.string :name
      t.text :info
      t.text :appeal
      t.integer :price
      t.string :address
      t.string :image
      t.references :user, foreign_key: true


      t.timestamps
    end
  end
end
