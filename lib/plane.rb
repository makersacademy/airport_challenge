
class Plane
    def land_at_airport(airport)
        fail "The airport is full" if airport.is_full?
    end

    def take_off_from_airport
    end

    def in_airport?
        false
    end 

end 