class UserProjectsController < ApplicationController
    before_action :authorized, only: []

    def index
        ups = UserProject.all
        render json: ups
    end

    def create

        user_project = UserProject.find_or_create_by(user_project_params)

        project = Project.find(user_project.project_id)

        if user_project.save 
            render json: project
        else
            render json: {error: user_project.errors.full_messages}, status: :not_acceptable
        end
    end

    def destroy
        up = UserProject.find(params[:id])
        project_id = up.project_id
        up.destroy
        project = Project.find(project_id)

        render json: project
    end

    private 
    
    def user_project_params
        params.require(:user_project).permit(:user_id, :project_id, :category)
    end


end
