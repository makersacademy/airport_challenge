class Plane

    def initialize
        @airport = []
    end

    def land_plane(plane, airport)
        plane.check_weather
        fail "PLANE NO" unless @airport.count < airport.capacity
        fail "Stormy! Plane GO AWAY!" if @weather == "Stormy"
        @airport << plane
        @airport
    end

    def take_off(plane, airport)
        plane.check_weather
        fail "Stormy! Plane STAY!" if @weather == "Stormy"
        @airport.delete(plane)
        @airport
    end

    def check_weather
        forecast = rand(100)
        if forecast > 94
            @weather = "Stormy"
       else
            @weather = "Clear"
       end
    end

end