class Project < ApplicationRecord
    has_many :photos
    has_many :comments
    has_many :permits

    has_many :user_projects
    has_many :users, through: :user_projects

    belongs_to :building
end
