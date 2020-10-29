class User < ApplicationRecord
    has_many :searches
    has_many :comments
    has_many :photos

    has_many :user_projects
    has_many :projects, through: :user_projects

end
