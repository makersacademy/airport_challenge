class Airport
    attr_accessor :planes

    def initialize(capacity = 20)
        @planes = []
        @capacity = capacity
    end

    def land_plane(plane, weather)
        raise "You cannot land. The airport is full" if is_airport_full?
        prevent_landing(weather)
        @planes << plane
    end

    def take_off(ready_plane, weather)
        prevent_takeoff(weather)

        plane_to_take_off = @planes.select { |plane| plane.flight_number == ready_plane.flight_number }[0]
        @planes.delete(plane_to_take_off)
        return plane_to_take_off
    end

    def prevent_takeoff(weather)
        raise "You cannot take off. Weather is stormy" if weather.stormy?
    end

    def prevent_landing(weather)
        raise "You cannot land. Weather is stormy" if weather.stormy?
    end

    def is_airport_full?
        @planes.length == @capacity
    end
end