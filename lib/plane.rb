require_relative 'airport'

class Plane

attr_reader :flying

def initialize
    @flying = true
end

def land(airport)
raise "CANNOT LAND A LANDED PLANE" if @flying == false
    @flying = false
    airport.land_plane(self)
end

def take_off(airport)
raise "A FLYING PLANE CANNOT TAKE-OFF" if @flying == true
    @flying = true
    airport.plane_take_off(self)
end

end
