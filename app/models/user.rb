class User < ApplicationRecord
    has_many :searches
    has_many :comments
    has_many :photos

    has_many :user_projects
    has_many :projects, through: :user_projects

    has_secure_password

    def getProjectsAsContractor
        contractorUPs = UserProject.all.filter{|up| up.user_id == self.id && up.category == "contractor"}
        contractorProjects = contractorUPs.map{|up| Project.find(up.project_id)}
    end

    def permits
        permits = Permit.all.filter{|permit| permit.user_id == self.id}
    end

    def type (projectId)
        self.user_projects.find_by(project_id: projectId).category
    end

    def up_id(projectId)
        self.user_projects.find_by(project_id: projectId).id
    end

    def full_name
        fullname = "#{self.first_name} #{self.last_name}"
        fullname.downcase.titlecase
    end



end


