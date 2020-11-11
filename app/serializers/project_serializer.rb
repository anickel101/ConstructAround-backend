class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :building_id, :job_num, :job_description, :job_type, :doc_num, :stakeholders, :permits

  has_many :permits
  has_many :comments
  has_many :photos


  def stakeholders
    object.users.map do |u|
      {id: u.id, first: u.first_name, last: u.last_name, business: u.business, phone: u.phone, type: u.type(object.id), img_url: u.img_url, name: u.full_name}
    end
  end

end