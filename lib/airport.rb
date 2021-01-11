require_relative 'planes'

class Airport
    attr_reader :plane
    attr_reader :capacity

    def initialize(capacity)
      @capacity = capacity
      @planes = []
    end

    def takenoff?
        Plane.new
    end

    def land (plane)
        raise 'airport full' if full?
        @planes << plane
    end


    def full?
        @planes.length >= @capacity
    end
end
