require_relative 'planes'

class Airport
    attr_reader :plane
    attr_reader :capacity

    def initialize(capacity)
      @capacity = capacity
      @planes = []
    end

    def takeoff(plane)
        raise 'weather too stormy to takeoff' if stormy?
    end

    def land(plane)
        raise 'airport full' if full?
        @planes << plane
    end

private

    def full?
        @planes.length >= @capacity
    end

    def stormy?
        rand(1..6) > 3
      end

end
