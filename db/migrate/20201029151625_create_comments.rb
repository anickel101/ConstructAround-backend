class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.belongs_to :user
      t.belongs_to :project
      t.string :content

      t.timestamps
    end
  end
end
