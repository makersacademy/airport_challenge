require_relative "airport"

class Plane

  def initialize
    @location
  end

  def land_at(airport)
    return "Landing is too dangerous" if airport.bad_weather?
    return "Sorry, the hanger is full" if airport.hanger_full?
    airport.hanger_plane(self)
    @location = airport
  end

  def take_off
    return "Taking off is too dangerous" if @location.bad_weather?
    airport.unhanger_plane(self)
    @location = "In the air."
  end

end
