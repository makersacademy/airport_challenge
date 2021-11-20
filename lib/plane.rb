
class Plane
    def land_at_airport(airport)
        fail "The airport is full" if airport.is_full?
        @in_aiport = true
    end

    def take_off_from_airport
        @in_airport = false
    end

    def in_airport?
       @in_aiport
    end 

end 