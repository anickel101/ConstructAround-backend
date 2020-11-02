class BuildingsController < ApplicationController

    def index
        buildings = Building.all
        render json: buildings
    end

    def show
        building = Building.find(params[:id])
        render json: building
    end

    def search

        # convert params into floats, insert decimal point to lat/lon
        lat_float = params[:lat].insert(-7, ".").to_f
        long_float = params[:long].insert(-7, ".").to_f
        range_float = (params[:range].to_f).round(6)

        buildings = Building.getSearchedBuildings(lat_float, long_float, range_float)

        render json: buildings
    end

end
