class CreateBuildings < ActiveRecord::Migration[6.0]
  def change
    create_table :buildings do |t|
      t.integer :bin
      t.float :gis_lat
      t.float :gis_long
      t.string :house_num
      t.string :street_name
      t.string :borough
      t.integer :block
      t.integer :lot

      t.timestamps
    end
  end
end
