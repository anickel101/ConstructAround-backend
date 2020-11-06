class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :building_id, :job_num, :job_description, :job_type, :doc_num, :stakeholders, :permits

  has_many :permits
  has_many :comments
  has_many :photos


  def stakeholders
    object.users.map do |u|
      {id: u.id, first: u.first_name, last: u.last_name, business: u.business, phone: u.phone, type: u.type(object.id)}
    end
  end

end


  #   t.bigint "user_id"
  #   t.bigint "project_id"
  #   t.string "category"
  #   t.datetime "created_at", precision: 6, null: false
  #   t.datetime "updated_at", precision: 6, null: false
  #   t.index ["project_id"], name: "index_user_projects_on_project_id"
  #   t.index ["user_id"], name: "index_user_projects_on_user_id"
  # end
  
  # create_table "users", force: :cascade do |t|
  #   t.string "first_name", default: "N/A"
  #   t.string "last_name", default: "N/A"
  #   t.string "business", default: "Individual"
  #   t.string "phone", default: "N/A"
  #   t.string "img_url", default: "https://www.pngitem.com/pimgs/m/504-5040528_empty-profile-picture-png-transparent-png.png"
  #   t.datetime "created_at", precision: 6, null: false
  #   t.datetime "updated_at", precision: 6, null: false
  # end

# create_table "projects", force: :cascade do |t|
#   t.bigint "building_id"
#   t.integer "job_num"
#   t.string "job_description"
#   t.string "job_type"
#   t.integer "doc_num"
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false
#   t.index ["building_id"], name: "index_projects_on_building_id"
# end

# bldg = findOrCreateBuilding(record)
# project = findOrCreateProject(bldg, record)
# owner = findOrCreateOwner(project, record)
# applicant = findOrCreateApplicant(project, record)

# def owned_cookbooks
#   object.owned_cookbooks.map do |oc|
#       {id: oc.id, owner_id: oc.owner.id, title: oc.title, recipes: recipes(oc)}
#   end
# end