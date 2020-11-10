class PermitSerializer < ActiveModel::Serializer
  attributes :id, :project_id, :permit_status, :work_type, :issued_date, :expiration_date, :sign_number, :user, :contractor

  belongs_to :user


  def contractor
    c = object.user
    {id: c.id, contractor_name: c.full_name, business: c.business, phone: c.phone}
  end

end