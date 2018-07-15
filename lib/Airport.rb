require_relative "Plane"
class Airport
    attr_reader :plane

    # Land method
    # Takes a plane as an argument
    def land(plane)
        @plane = plane
    end

    # Take off method
    def take_off(plane)
        @plane
    end
end