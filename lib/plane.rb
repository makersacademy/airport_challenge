require_relative 'airport'

class Plane

  def initialize
    @landed = false
  end

  attr_reader :landed

  def land(airport)
    raise 'Unable to land, plane is already landed' if landed == true
    raise 'Landing prevented: Airport full' if airport.full?
    return "Unable to land. Weather is stormy" if airport.check_weather == "stormy"
    @landed = true
    airport.send_to_hangar(self)
    # airport
  end

  def take_off(airport)
    raise 'Unable to take-off. Plane already flying' if landed == false
    raise 'Unable to take-off. Plane not in that airport' unless airport.hangar.include?(self) 
    return "Unable to take-off. Weather is stormy" if airport.check_weather == "stormy"
    airport.taxi_to_runway(self)
    @landed = false
    return "#{self} is no longer in #{airport}" 
  end

end
