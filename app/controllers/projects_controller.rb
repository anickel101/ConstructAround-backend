class ProjectsController < ApplicationController
    before_action :authorized, only: []

    def index
        projects = Project.all
        render json: projects
    end

    def show

    end


end
