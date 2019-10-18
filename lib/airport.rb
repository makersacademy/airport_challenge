class Airport
    attr_reader :planes_arr

    def initialize
        @planes_arr = []
    end

    def land_at_airport(plane)
        @planes_arr << plane
    end

    def take_off(plane)
        @planes_arr.pop
    end

    def check_weather(weather)
        fail "Plane cannot take off" if weather == "Stormy"
        @planes_arr.pop
    end
end