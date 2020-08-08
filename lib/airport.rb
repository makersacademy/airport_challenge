require_relative 'plane'
class Airport
    attr_reader :planes
    attr_reader :capacity
    DEFAULT_CAPACITY = 50
    def initialize(capacity= DEFAULT_CAPACITY)
        @capacity = capacity
        @planes = []
    end
    def land(plane)
        fail 'airport is full' if full?
        @planes.push(plane)
        @planes[@planes.length - 1]
    end

    def take_off
       @planes.pop()
    end

    private
    def full?
        if @planes.count >= DEFAULT_CAPACITY
            true
        end
    end
end