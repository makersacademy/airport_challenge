class Airport

    def initialize
        @planes = []
    end

    def land_plane(capacity = 5)
        fail "Landing not possible, airport is full" if @planes.count >= capacity
        @planes << Plane.new
    end

    def plane_take_off
        "The plane is no longer in the airport"
    end

end