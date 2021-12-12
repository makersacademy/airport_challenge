class Plane

    def initialize
        @airport = []
    end

    def land_plane(plane, airport)
        @weather = plane.check_weather
        fail "PLANE NO" unless @airport.count < airport.capacity
        fail "Stormy! Plane GO AWAY!" if @weather == "Stormy"
        @airport << plane
        @airport
    end

    def take_off(plane, airport)
        @weather = plane.check_weather
        fail "Stormy! Plane STAY!" if @weather == "Stormy"
        @airport.delete(plane)
        @airport
    end

    def check_weather
        "Stormy" if rand(100) > 94
        "Clear"
    end

end