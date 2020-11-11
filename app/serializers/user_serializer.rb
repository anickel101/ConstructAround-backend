class UserSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name, :business, :phone, :img_url, :full_name, :username, :user_projects

    def full_name
      object.full_name
    end

  end