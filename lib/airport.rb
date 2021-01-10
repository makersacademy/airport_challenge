require_relative 'plane'

class Airport
    attr_accessor :hangar, :plane

    def initialize
        @hangar = []
    end

    def land(plane)
        @hangar.push(plane) 
    end

    def takeoff
        @hangar.pop
    end

end