class Plane

    def land(airport)
        fail 'Airport is full' if airport.hanger.length >= 1
        airport.hanger.push(self)
        @current_airport = airport
    end

    def takeoff
        @current_airport.hanger.delete(self)
    end

end