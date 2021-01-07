class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :username
      t.string :password_digest
      t.string :name
      t.date :birthdate
      t.string :email
      t.string :phone_one

      t.timestamps null: false
    end
  end
end
