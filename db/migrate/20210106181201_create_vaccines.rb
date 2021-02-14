class CreateVaccines < ActiveRecord::Migration
  def change
    create_table :vaccines do |t|
      t.belongs_to :user
      t.string :lot_no
      t.string :mfr
      t.string :vac_type
      t.date :expir
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
