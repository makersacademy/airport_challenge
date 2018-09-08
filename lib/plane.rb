require "airport"

class Plane

  def initialize
    @location
  end

  def land_at(airport)
    return "Landing is too dangerous" if airport.bad_weather?
    return "Sorry, the hanger is full" if airport.hanger_full?
    airport.put_plane_in_hanger(self)
    @location = airport
  end

  def take_off
    return "Taking off is too dangerous" if @location.bad_weather?
    @location = "In the air."
  end

end
