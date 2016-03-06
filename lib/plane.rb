require_relative 'airport'

class Plane

attr_reader :flying

  def initialize
    @flying = true
  end

  def land(airport)
    raise "CANNOT LAND A LANDED PLANE" if @flying == false
    airport.allow_landing(self)
    @flying = false
  end

  def take_off(airport)
    raise "A FLYING PLANE CANNOT TAKE-OFF" if @flying == true
    raise "PLANE IS NOT AT THAT AIRPORT" if !in_airport?(airport)
    airport.allow_take_off(self)
    @flying = true
  end

private

  def in_airport?(airport)
    airport.planes.include?(self)
  end

end
