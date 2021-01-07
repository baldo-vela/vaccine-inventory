class CreateVaccines < ActiveRecord::Migration
  def change
    create_table :vaccines do |t|
      t.string :lot_no
      t.string :mfr
      t.string :type
      t.date :expir
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
