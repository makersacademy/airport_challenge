class Plane

    def initialize
        @airport = []
    end

    def land_plane(plane, airport)
        fail "PLANE NO" unless @airport.empty?
        @airport << plane
        @airport
    end

    def take_off(plane, airport)
        @airport.delete(plane)
        @airport
    end

    def check_weather

    end

    def left_airport

    end
end