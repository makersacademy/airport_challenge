require_relative 'plane'

class Airport

    attr_reader :airport, :capacity, :weather

    DEFAULT_CAPACITY = 20

    def initialize(capacity=DEFAULT_CAPACITY)
        @airport = []
        @capacity = capacity
        # @weather = weather
    end
    def land(plane)
        fail "Error airport full." if full?
        @airport << plane
    end

    def take_off(plane)
        @airport.delete(plane)
    end

    private

    def full?
      @airport.length >= @capacity
    end
end