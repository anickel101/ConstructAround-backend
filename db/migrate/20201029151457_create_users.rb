class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :business
      t.string :phone
      t.string :img_url

      t.timestamps
    end
  end
end
