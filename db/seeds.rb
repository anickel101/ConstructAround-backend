require 'net/http'
require 'open-uri'
require 'json'
require 'uri'
require 'openssl'
require 'faker'
require 'byebug'

User.all.destroy_all
Project.all.destroy_all
Building.all.destroy_all
Search.all.destroy_all
Comment.all.destroy_all
Photo.all.destroy_all
UserProject.all.destroy_all


def findOrCreateBuilding(record)
    bldg = Building.find_by(bin: record.bin__.to_i)
    if bldg == nil
        bldg = Building.create(bin: record.bin__.to_i, house_num: record.house__.to_i, street_name: record.street_name, borough: record.borough, block: record.block.to_i, lot: record.lot.to_i, gis_lat: record.gis_latitude.to_f, gis_long: record.gis_longitude.to_f)
    end
    bldg
end

def findOrCreateProject(bldg, record)
    project = Project.find_by(job_num: record.job__.to_i)
    if project == nil
        project = Project.create(building_id: bldg.id, job_num: record.job__.to_i, job_type: record.job_type, doc_num: record.doc__.to_i, job_description: record.job_description)
    end
    project
end

def findOrCreateOwner(project, record)
    owner = User.where(first_name: record.owner_s_first_name, last_name: record.owner_s_last_name).first_or_create do |user|
        user.phone = record.owner_s_phone__
        user.business = record.owner_s_business_name
    end
    relationship = UserProject.where(user_id: owner.id, project_id: project.id).first_or_create do |r| 
        r.category = "owner"
    end
    owner
end

def findOrCreateApplicant(project, record)
    applicant = User.where(first_name: record.applicant_s_first_name, last_name: record.applicant_s_last_name).first_or_create do |user|
        user.phone = "N/A"
    end
    relationship = UserProject.where(user_id: applicant.id, project_id: project.id).first_or_create do |r| 
        r.category = "applicant"
    end
end

def findOrCreateContractor(project, record)
    contractor = User.where(first_name: record.permittee_s_first_name, last_name: record.permittee_s_last_name).first_or_create do |cont|
        cont.phone = record.permittee_s_phone__
        cont.business = record.permittee_s_business_name
    end
    relationship = UserProject.where(user_id: contractor.id, project_id: project.id).first_or_create do |r| 
        r.category = "contractor"
    end
end

def check
    buildings = Building.all
    buildings.each_with_index do |b, i|
        puts "Building #{i}"
        puts b.bin
    end
    projects = Project.all
    projects.each_with_index do |b, i|
        puts "Project #{i}"
        puts b.job_num
    end
end

def getJobFilingsFromAPI

    # Application Filings (Whole City)
    filingsUrl = "https://data.cityofnewyork.us/resource/ic3t-wcy2.json"

    client = SODA::Client.new({:domain => "data.cityofnewyork.us"})

    filings = client.get(filingsUrl, {"$where" => "job_status = 'R'", "$limit" =>2})
    
    filings.body.each do |record|
        bldg = findOrCreateBuilding(record)
        project = findOrCreateProject(bldg, record)
        owner = findOrCreateOwner(project, record)
        applicant = findOrCreateApplicant(project, record)
    end

end

def getPermitsFromAPI

    # Active Permits Issued (Whole City)
    permitsUrl = "https://data.cityofnewyork.us/resource/ipu4-2q9a.json"

    client = SODA::Client.new({:domain => "data.cityofnewyork.us"})

    permits = client.get(permitsUrl, {"$where" => "permit_status = 'ISSUED'", "$limit" =>2})
    
    permits.body.each do |record|
        bldg = findOrCreateBuilding(record)
        project = findOrCreateProject(bldg, record)
        contractor = findOrCreateContractor(project, record)
    end

end

getJobFilingsFromAPI()
getPermitsFromAPI()


    # ------------------

    # $$app_token=APP_TOKEN

    # uri = URI("https://data.cityofnewyork.us/resource/ipu4-2q9a.json?$limit=1")

    # http = Net::HTTP.new(uri.host, uri.port)
    # http.use_ssl = true

    # http.start do |http|
    #     request = Net::HTTP::Get.new("/")
    #     response = http.request(request)
    #     data = response.body
    #     byebug
    # end

    # # req["X-App-Token"] = ENV["OPEN_DATA_APP_TOKEN"]
    # # req["Accept"] = "application/json"

    # byebug

        # WORKS!!

    # url = "https://data.cityofnewyork.us/resource/ipu4-2q9a.json?$where=zip_code=%2711218%27&$limit=1"

    # uri = URI.parse(url)
    # response = Net::HTTP.get_response(uri)
    # project = JSON.parse(response.body)
    # byebug

    # ---------------