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
        @planes.push(plane)
    end
    def take_off
        fail 'No planes available' if empty?
        fail 'Weather conditions too stormy for take-off' if stormy?
        @planes.pop
    end

    private
    def full?
        return @planes.count >= @capacity ? true : false
    end

    def empty?
        return @planes.empty? ? true : false
    end

    def stormy?
        rand(10) > 7
    end
end