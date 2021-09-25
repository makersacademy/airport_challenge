require 'plane'

class Airport

    def initialize
        @hangar =[]
    end

    def land(plane)
        plane = Plane.new
        @hangar << plane.class.to_s #adds Plane into hangar, instead of object id
    end

end