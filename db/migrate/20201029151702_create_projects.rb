class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.belongs_to :building
      t.integer :job_num
      t.string :job_description
      t.string :job_type
      t.integer :doc_num

      t.timestamps
    end
  end
end
