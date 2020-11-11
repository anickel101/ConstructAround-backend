class PermitSerializer < ActiveModel::Serializer
  attributes :id, :project_id, :permit_status, :work_type, :issued_date, :expiration_date, :sign_number, :contractor

  belongs_to :contractor

  def contractor
    c = object.contractor
    {id: c.id, contractor_name: c.full_name, business: c.business, phone: c.phone}
  end

end