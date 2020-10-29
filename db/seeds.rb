User.all.destroy_all
Project.all.destroy_all
Building.all.destroy_all
Search.all.destroy_all
Comment.all.destroy_all
Photo.all.destroy_all
UserProject.all.destroy_all

anson = User.create()
reva = User.create()
archie = User.create()

BUILDING_ONE = Building.create()
BUILDING_TWO = Building.create()

TEST_PROJECT_ONE = Project.create(building_id: Building.all.sample.id)
TEST_PROJECT_TWO = Project.create(building_id: Building.all.sample.id)
TEST_PROJECT_THREE = Project.create(building_id: Building.all.sample.id)
TEST_PROJECT_FOUR = Project.create(building_id: Building.all.sample.id)
TEST_PROJECT_FIVE = Project.create(building_id: Building.all.sample.id)

search_one = Search.create(user_id: anson.id)

comment_one = Comment.create(user_id: anson.id, project_id: Project.all.sample.id)

photo_one = Photo.create(user_id: anson.id, project_id: Project.all.sample.id)

user_project1 = UserProject.create(user_id: anson.id, project_id: Project.all.sample.id)


























# {
# "borough": "BROOKLYN",
# "bin__": "3124272",
# "house__": "261",
# "street_name": "EAST    4 STREET",
# "job__": "301302007",
# "job_doc___": "01",
# "job_type": "A1",
# "block": "05327",
# "lot": "00058",
# "zip_code": "11218",

# "permit_status": "ISSUED",
# "filing_status": "RENEWAL",
# "permit_type": "AL",
# "permit_sequence__": "16",
# "site_fill": "NOT APPLICABLE",
# "filing_date": "10/26/2020",
# "issuance_date": "10/26/2020",
# "expiration_date": "03/27/2021",
# "job_start_date": "10/31/2002",

# "permittee_s_first_name": "MARK",
# "permittee_s_last_name": "DORNHELM",
# "permittee_s_business_name": "CONSERVATION PLUMBING & H",
# "permittee_s_phone__": "7182305444",
# "permittee_s_license_type": "GC",
# "permittee_s_license__": "0004819",

# "owner_s_business_name": "SELF",
# "owner_s_first_name": "ROSALIND",
# "owner_s_last_name": "DORNHELM",
# "owner_s_house__": "309",
# "owner_s_house_street_name": "ALBEMARLE ROAD",
# "city": "BROOKLYN",
# "state": "NY",
# "owner_s_zip_code": "11218",
# "owner_s_phone__": "7184357448",

# "gis_latitude": "40.646062",
# "gis_longitude": "-73.976955",
# "gis_nta_name": "Windsor Terrace"
# },