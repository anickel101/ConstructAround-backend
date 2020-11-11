class Project < ApplicationRecord
    has_many :photos
    has_many :comments
    has_many :permits

    has_many :user_projects
    has_many :users, through: :user_projects

    belongs_to :building

    def getLat
        self.building.gis_lat
    end

    def getLong
        self.building.gis_long
    end

    def address
        self.building.partial_address
    end

end
