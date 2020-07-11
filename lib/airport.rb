require_relative 'weather'
require_relative 'plane'

class Airport
    attr_reader :capacity

    DEFAULT_CAPACITY = 100

    def initialize(capacity=DEFAULT_CAPACITY)
        @capacity = capacity
        @planes = []
    end

    def planes
        @planes
    end

    def full?
        planes.count >= @capacity
    end

    def land(plane=Plane.new)
        fail 'Plane is not flying' if plane.flying? == false
        fail 'Airport is at capacity' if self.full?
        planes << plane
    end

end
