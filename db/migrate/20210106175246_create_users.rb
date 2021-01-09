class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.date :birthdate
      t.string :email
      t.string :phone_one
      t.boolean :admin

      t.timestamps null: false
    end
  end
end
