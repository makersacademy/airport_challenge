require_relative 'plane'

class Airport
    attr_reader :planes, :capacity

    DEFAULT_CAPACITY = 20

    def initialize(capacity=DEFAULT_CAPACITY)
        @planes = []
        @capacity = capacity
    end
    def land(plane)
        fail 'Airport is full' if full?
        fail 'Weather conditions too stormy for landing' if stormy?
        planes << plane
    end
    def take_off
        fail 'No planes available' if empty?
        fail 'Weather conditions too stormy for take-off' if stormy?
        planes.pop
    end
    def stormy?
        rand(10) > 7
    end

    private
    def full?
        planes.count >= capacity
    end

    def empty?
        planes.empty?
    end

end