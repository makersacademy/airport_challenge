require_relative 'airport'

class Plane
    
    def land(airport)
        airport.hangar << self
    end
    
end