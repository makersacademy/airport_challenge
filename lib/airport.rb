require_relative 'plane'

class Airport
    attr_reader :plane

    def initialize
        @plane = []
    end

    def land(plane)
       fail "No space to land" if @plane.count >= 2
       @plane << plane
    end 

    def take_off(plane)
        @plane.pop
    end 
end 