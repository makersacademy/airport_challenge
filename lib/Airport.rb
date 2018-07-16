require_relative "Plane"
class Airport
    attr_reader :hangar 

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
        # fail "Unable to take off due to storm" if stormy?
        @hangar.pop()
        "#{plane} has taken off"
    end

    # def stormy?
    #     true
    # end
end

