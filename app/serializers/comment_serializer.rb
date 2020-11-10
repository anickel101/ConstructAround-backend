class CommentSerializer < ActiveModel::Serializer
    attributes :id, :project_id, :user_id, :content, :name, :post_date
  
    def name
        object.user.full_name
    end

    def post_date
        Time.zone = 'Eastern Time (US & Canada)'
        object.created_at.strftime("%b%e,%l:%M %p")
    end
  
  end