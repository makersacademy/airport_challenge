require_relative "airport"

class Plane

  def initialize
    @location = Airport.new
  end

  def land_at(airport)
    return "You are already, on the ground" if @location != "In the air"
    return "Landing is too dangerous" if airport.bad_weather?
    return "Sorry, the hanger is full" if airport.hanger_full?
    airport.hanger_plane(self)
    @location = airport
  end

  def take_off
    return "Taking off is too dangerous" if @location.bad_weather?
    @location.unhanger_plane(self)
    @location = "In the air"
  end

end
