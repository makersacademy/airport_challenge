require_relative 'airport'

class Plane

  def land(airport)
    return "Unable to land. Weather is stormy" if airport.check_weather == "stormy"
    raise 'Landing prevented: Airport full' if airport.full?
    airport.send_to_hangar(self)
    airport
  end

  def take_off(airport)
    return "Unable to take-off. Weather is stormy" if airport.check_weather == "stormy"
    airport.taxi_to_runway(self)
    return "#{self} is no longer in #{airport}" 
  end

end
