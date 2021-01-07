class CreateImmunizationSites < ActiveRecord::Migration
  def change
    create_table :immunization_sites do |t|
      

      t.timestamps null: false
    end
  end
end
