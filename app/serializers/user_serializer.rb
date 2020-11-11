class UserSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name, :business, :phone, :img_url, :full_name, :username, :user_projects, :followeds

    def full_name
      object.full_name
    end

    def followeds
      object.projects.map do |p|
        {project_id: p.id, building_id: p.building_id, p_lat: p.getLat(), p_long: p.getLong(), address: p.address(), job_num: p.job_num}
      end
    end

  end

  # def stakeholders
  #   object.users.map do |u|
  #     {id: u.id, first: u.first_name, last: u.last_name, business: u.business, phone: u.phone, type: u.type(object.id), img_url: u.img_url, name: u.full_name, up_id: u.up_id(object.id)}
  #   end
  # end