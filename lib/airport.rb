require 'plane'

class Airport

    attr_accessor :hangar

    def initialize
        @hangar =[]
    end

    def land(plane)
        @hangar << plane.class.to_s #adds Plane into hangar, instead of object id
    end

    def take_off
        @hangar.pop
    end

end