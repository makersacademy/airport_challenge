require_relative 'airport'

class Plane

  def land(airport)
    raise 'Unable to land, plane is already landed' if @landed == true
    return "Unable to land. Weather is stormy" if airport.check_weather == "stormy"
    raise 'Landing prevented: Airport full' if airport.full?
    @landed = true
    airport.send_to_hangar(self)
    airport
  end

  def take_off(airport)
    raise 'Unable to take-off. Plane not in that airport' unless airport.hangar.include?(self) 
    return "Unable to take-off. Weather is stormy" if airport.check_weather == "stormy"
    airport.taxi_to_runway(self)
    @landed = false
    return "#{self} is no longer in #{airport}" 
  end
end
