class BuildingsController < ApplicationController

    def index
        buildings = Building.all
        render json: buildings
    end

    def show
    end

end
