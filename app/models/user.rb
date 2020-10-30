class User < ApplicationRecord
    has_many :searches
    has_many :comments
    has_many :photos

    has_many :user_projects
    has_many :projects, through: :user_projects

    def getProjectsAsContractor
        contractorUPs = UserProject.all.filter{|up| up.user_id == self.id && up.category == "contractor"}
        contractorProjects = contractorUPs.map{|up| Project.find(up.project_id)}
    end

    def permits
        permits = Permit.all.filter{|permit| permit.user_id == self.id}
    end


end
