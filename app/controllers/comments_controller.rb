class CommentsController < ApplicationController
    before_action :authorized, only: []


    def index
        comments = Comment.all
        render json: comments
    end

    def create

        comment = Comment.create(comment_params)

        if comment.save 
            render json: comment
        else
            render json: {error: comment.errors.full_messages}, status: :not_acceptable
        end


    end

    private

    def comment_params
        params.require(:comment).permit(:user_id, :project_id, :content)
    end

end
