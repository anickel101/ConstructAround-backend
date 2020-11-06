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

    def buildingImage
        size = params[:size]
        location = params[:location]
        key = params[:key]

        url = "https://maps.googleapis.com/maps/api/streetview?location=#{location}&size=#{size}&key=#{key}"

        resp = nil

        uri = URI("https://maps.googleapis.com/maps/api/streetview?location=#{location}&size=#{size}&key=#{key}")

        puts "URL: #{url}"

        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true

        http.start do |http|
            request = Net::HTTP::Get.new("/")
            response = http.request(request)
            resp = response.body
        end

        render json: url

    end

end

        # uri = URI("https://maps.googleapis.com/maps/api/streetview?")

        # http = Net::HTTP.new(uri.host, uri.port)
        # http.use_ssl = true

        # http.start do |http|
        #     request = Net::HTTP::Get.new("/")
        #     response = http.request(request)
        #     data = response.body
        #     byebug
        # end

# let size = "600x400"
# let key = process.env.REACT_APP_GOOGLE_API_KEY
# let options = {headers: {
#     "Content-Type": "application/json",
#     "Accept": "application/json"
# }}

# fetch(`https://maps.googleapis.com/maps/api/streetview?location=${address}&size=${size}&key=${key}`
