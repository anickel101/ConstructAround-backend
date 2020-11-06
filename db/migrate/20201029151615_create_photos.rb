class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.belongs_to :user
      t.belongs_to :project
      t.string :img_url
      t.string :description

      t.timestamps
    end
  end
end
