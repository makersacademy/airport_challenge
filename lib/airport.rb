require_relative 'weather'
require_relative 'plane'

class Airport
    attr_reader :capacity, :planes

    DEFAULT_CAPACITY = 100

    def initialize(capacity=DEFAULT_CAPACITY)
        @capacity = capacity
        @planes = []
    end

    def land(plane=Plane.new)
        @planes << plane
    end

end
