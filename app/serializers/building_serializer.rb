class BuildingSerializer < ActiveModel::Serializer
  attributes :id, :bin, :gis_lat, :gis_long, :house_num, :street_name, :city, :state, :zip, :borough, :block, :lot, :projects, :full_address


  def projects
    object.projects.map do |p|

      permits = []
      p.permits.map do |perm|
        permits.push({id: perm.id, project_id: p.id, permit_status: perm.permit_status, work_type: perm.work_type, issued_date: perm.issued_date, expiration_date: perm.expiration_date, sign_number: perm.sign_number, contractor: perm.contractor})
      end

      comments = []
      p.comments.map do |comm|
        comments.push({id: comm.id, project_id: comm.project_id, user_id: comm.user_id, name: comm.full_name, post_date: comm.post_date, content: comm.content })
      end

      photos = []
      p.photos.map do |photo|
        photos.push({id: photo.id, user: photo.user.full_name, user_type: photo.user.type(p.id), project_id: photo.project_id, img_url: photo.img_url, description: photo.description})
      end

      {id: p.id, building_id: p.building_id, job_num: p.job_num, job_description: p.job_description, job_type: p.job_type, doc_num: p.doc_num, permits: permits, comments: comments, photos: photos, stakeholders: stakeholders(p)}

    end

  end

  def stakeholders(project)
    project.users.map do |u|
      {id: u.id, first: u.first_name, last: u.last_name, business: u.business, phone: u.phone, type: u.type(object.id)}
    end
  end

end