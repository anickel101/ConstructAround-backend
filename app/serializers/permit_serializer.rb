class PermitSerializer < ActiveModel::Serializer
  attributes :id, :project_id, :permit_status, :work_type, :issued_date, :expiration_date, :sign_number, :user, :contractor

  belongs_to :user


  def contractor
    c = object.user
    {id: c.id, contractor_name: c.full_name, business: c.business, phone: c.phone}
  end

end

# def owned_cookbooks
#   object.owned_cookbooks.map do |oc|
#       {id: oc.id, owner_id: oc.owner.id, title: oc.title, recipes: recipes(oc)}
#   end
# end


# create_table "permits", force: :cascade do |t|
#   t.bigint "project_id"
#   t.string "permit_status"
#   t.string "work_type"
#   t.string "issued_date"
#   t.string "expiration_date"
#   t.integer "sign_number"
#   t.bigint "user_id"
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false
#   t.index ["project_id"], name: "index_permits_on_project_id"
#   t.index ["user_id"], name: "index_permits_on_user_id"
# end