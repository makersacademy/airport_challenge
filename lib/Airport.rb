
class Airport
    attr_accessor :planes, :capacity

    def initialize
        @planes = []
        @capacity = 10
    end

    def land(plane)
        fail "Airport full: cannot land" if full?
        @planes << plane

        plane.land
    end

    def full?
        @planes.count >= 10  ? true : false
    end
end