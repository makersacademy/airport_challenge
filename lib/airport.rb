require_relative 'weather'

class Airport < Weather

    attr_reader :capacity

    DEFAULT_CAPACITY = 20

    def initialize(capacity = DEFAULT_CAPACITY)
        @hangar = []
        @capacity = capacity
    end

    def land(plane)
        fail 'Airport is full' if full?
        fail 'Plane cannot land due to stormy weather' if stormy?
        @hangar << plane
    end

    def take_off(plane)
        fail 'Plane cannot take off due to stormy weather' if stormy?
        @hangar.pop(plane)
    end

    private

    def full?
        @hangar.length >= capacity
    end

end