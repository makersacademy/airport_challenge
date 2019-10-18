class Airport
    attr_reader :planes_arr

    def initialize
        @planes_arr = []
    end

    def land_at_airport(plane)
        planes_arr << plane
    end

    def take_off(plane)
        planes_arr.pop
    end
end