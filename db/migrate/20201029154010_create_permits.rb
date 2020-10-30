class CreatePermits < ActiveRecord::Migration[6.0]
  def change
    create_table :permits do |t|
      t.belongs_to :project

      t.timestamps
    end
  end
end
