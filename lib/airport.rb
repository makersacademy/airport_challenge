require_relative 'plane'

class Airport
    attr_reader :plane

    def land(plane)
       fail "No space to land" if @plane
       @plane = plane
    end 

    def take_off(plane)
        @plane = nil
    end 
end 