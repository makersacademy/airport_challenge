class Plane

    @current_airport

    def land(airport)
        airport.hanger.push(self)
        @current_airport = airport
    end

    def takeoff
        @current_airport.hanger.delete(self)
    end

end