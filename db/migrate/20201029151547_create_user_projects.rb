class CreateUserProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :user_projects do |t|
      t.belongs_to :user
      t.belongs_to :project
      t.string :category

      t.timestamps
    end
  end
end
