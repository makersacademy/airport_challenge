require_relative 'weather'

class Airport

    attr_reader :capacity

    DEFAULT_CAPACITY = 20

    def initialize(capacity = DEFAULT_CAPACITY)
        @hangar = []
        @capacity = capacity
    end

    def land(plane)
        fail 'Airport is full' if full?
        @hangar << plane
    end

    def take_off(plane)
        @hangar.pop(plane)
    end

    private

    def full?
        @hangar.length >= capacity
    end

end