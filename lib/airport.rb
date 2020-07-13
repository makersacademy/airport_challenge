
class Airport
    def initialize(capacity = capacity)
       @capacity = capacity
       @number_of_planes_landed = []
    end
    def land(plane)
        fail 'this airport is full' if full?
        raise 'stormy weather, cannot land' if stormy?
        @number_of_planes_landed << plane
    end

    def take_off(plane)
    end

    private

    def full?
        @number_of_planes_landed.length >= @capacity
    end
    def stormy?
        rand(1..6) > 3
    end
end