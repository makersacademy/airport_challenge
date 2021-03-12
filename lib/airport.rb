require_relative 'plane'

class Airport
    DEFAULT_CAPACITY = 2
    attr_reader :plane
    attr_accessor :capacity

    def initialize(capacity=DEFAULT_CAPACITY)
        @planes = []
        @capacity = capacity
    end

    def planes_at_airport
        @planes
    end

    def land(plane)
        fail 'Airport full' if airport_full
        @planes.append(plane)
    end

    def take_off(plane)
        @planes.delete(plane)
        "Plane #{plane} has taken off."
    end

    def airport_full
        @planes.count >= capacity
    end
end