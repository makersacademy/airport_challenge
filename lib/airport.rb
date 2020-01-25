require_relative 'plane'

class Airport

    DEFAULT_CAPACITY = 2
    attr_reader :plane

    def initialize
        @plane = []
    end

    def land(plane)
       fail "No space to land" if full?
       @plane << plane
    end 

    def take_off(plane)
        @plane.pop
    end 

    def full?
        @plane.count >= DEFAULT_CAPACITY
    end 
end 