class UserSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :project_id, :category
end