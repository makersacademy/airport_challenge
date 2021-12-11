class Plane

    def initialize
        @airport = []
    end

    def land_plane(plane, airport)
        fail "PLANE NO" unless @airport.empty?
        fail "Stormy! Plane GO AWAY!" if @weather == "Stormy"
        @airport << plane
        @airport
    end

    def take_off(plane, airport)
        fail "Stormy! Plane STAY!" if @weather == "Stormy"
        @airport.delete(plane)
        @airport
    end

    def check_weather(weather)
        @weather = weather
    end

end