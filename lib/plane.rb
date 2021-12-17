require_relative 'airport'

class Plane

  def land(airport)
    airport
  end

  def take_off(airport)
    airport.taxi_to_runway(self)
    return "#{self} is no longer in #{airport}" if airport.hangar == ""
  end
end
