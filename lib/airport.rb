class Airport

    def initialize(capacity = 20)
        @default_capacity = capacity
        @planes_at_airport = []
    end

    def land(landing_planes)
        landing_planes.each do |plane|
            puts "#{plane} has landed"
            @planes_at_airport << plane
        end
        return @planes_at_airport
    end

    def takeoff(leaving_plane)
        leaving_plane.each do |plane|
            puts  "#{plane} has left"
            @planes_at_airport -= [plane]
        end

        return @planes_at_airport
    end

    private
    
    def full?
        @planes_at_airport.count == @default_capacity
    end


end