require 'weather'

class Plane
    attr_accessor :land

    def at_airport 
      true
    end

    def plane(land)
    fail "Weather stormy, unable to land" if current_weather = "stormy"
    end
end