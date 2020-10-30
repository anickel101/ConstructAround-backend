class AddDefaultToUserBusiness < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :business, :string, default: 'Individual'
    change_column :users, :img_url, :string, default: "https://www.pngitem.com/pimgs/m/504-5040528_empty-profile-picture-png-transparent-png.png"
    change_column :users, :first_name, :string, default: 'N/A'
    change_column :users, :last_name, :string, default: 'N/A'
    change_column :users, :phone, :string, default: 'N/A'
  end
end
