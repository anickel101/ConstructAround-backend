class PhotosController < ApplicationController

    def index
        photos = Photo.all 
        render json: photos
    end


    def create
        
        image = Cloudinary::Uploader.upload(params[:image])
        
        photo = Photo.create(user_id: params["user_id"], img_url: image["url"], project_id: params["project_id"].to_i, description: params["description"])
        

        if photo.save 
            render json: photo
        else
            render json: {error: photo.errors.full_messages}, status: :not_acceptable
        end
    end

end
