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
        "#{plane} has landed"
    end

    # Take off method
    def take_off(plane)
        # fail "Unable to take off due to storm" if stormy?
        # Remove plane from hangar
        # If the plane is in the hangar
        if hangar.include?(plane)
            plane_index = @hangar.index(plane)
            @hangar.delete_at(plane_index)
            return plane
            # "#{plane} has taken off"
        end
    end

    # def stormy?
    #     true
    # end
end

