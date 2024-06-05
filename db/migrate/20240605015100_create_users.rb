class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :avatar
      t.text :appeal
      t.string :password_digest
      t.string :session_token

      t.timestamps
    end
  end
end
