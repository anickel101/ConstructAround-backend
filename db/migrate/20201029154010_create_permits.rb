class CreatePermits < ActiveRecord::Migration[6.0]
  def change
    create_table :permits do |t|
      t.belongs_to :project
      t.string :permit_status
      t.string :work_type
      t.string :issued_date
      t.string :expiration_date
      t.integer :sign_number

      t.belongs_to :user

      t.timestamps
    end
  end
end
