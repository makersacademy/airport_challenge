require_relative "Plane"
class Airport
    attr_reader :hangar, :weather
    weather = "stormy"

    def initialize
        @hangar = []
    end 

    # Land method
    # Takes a plane as an argument
    def land(plane) 
        @hangar << plane
    end

    # Take off method
    def take_off(plane)
        @hangar.pop()
    end
end