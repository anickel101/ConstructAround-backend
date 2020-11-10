class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :project

    def full_name
        self.user.full_name
    end

    def post_date
        Time.zone = 'Eastern Time (US & Canada)'
        self.created_at.strftime("%b%e,%l:%M %p")
    end

end
