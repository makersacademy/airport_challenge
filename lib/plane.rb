class Plane
    def initialize
        @in_flight = false
    end

    def land
        fail "Plane already landed" if !@in_flight
        @in_flight = false
    end

    def take_off
        fail "Plane already departed" if @in_flight
        @in_flight = true 
    end

    def in_flight?
        @in_flight
    end
end