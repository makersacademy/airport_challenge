require_relative 'airport'

class Plane

attr_reader :flying

def initialize
    @flying = true
end

def land(airport)
    @flying = false
    airport.land_plane(self)
end

def take_off(airport)
    @flying = true
    airport.plane_take_off(self)
end

end
