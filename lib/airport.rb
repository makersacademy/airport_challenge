class Airport

    def land(landing_planes)
        landing_planes.each do |plane|
            puts "#{plane} has landed"
            @planes_at_airport << plane
            return @planes_at_airport
        end
    end

    
    def takeoff(leaving_plane)
        leaving_plane.each do |plane|
            puts  "#{plane} has left"
            @planes_at_airport -= [plane]
        end
        
        return @planes_at_airport
    end


end