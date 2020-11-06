class Building < ApplicationRecord
    has_many :projects

    def full_address
    
        "#{self.house_num} #{self.street_name}, #{self.city}, #{self.state}, #{self["zip"]}"  

    end

    def self.getSearchedBuildings(lat, long, range)
        self.all.filter{|b| b.distanceToSearchCenter(lat, long) <= range}
    end

    # Haversine Formula for Great Circles, adapted to Ruby (Formula not mine, adaption is)
    def distanceToSearchCenter(centerLat, centerLong)

        # kilometers
        earthRadius = 6371 

        buildingLat = self.gis_lat
        buildingLong = self.gis_long

        buildingLatRad = buildingLat/180 * Math::PI
        centerLongRad = centerLong/180 * Math::PI


        dLat = (centerLat-buildingLat)/180 * Math::PI;
        dLon = (centerLong-buildingLong)/180 * Math::PI;

        a = Math.sin(dLat/2) * Math.sin(dLat/2) +
            Math.cos(buildingLatRad) * Math.cos(centerLongRad) *
            Math.sin(dLon/2) * Math.sin(dLon/2);

        c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));

        distanceMeters = 6371*1000 * c; 
        puts distanceMeters
        distanceMeters
     end

end
