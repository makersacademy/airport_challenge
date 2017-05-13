require_relative 'airport.rb'

class Plane

  def land(airport)
    airport.plane = self
  end

  def take_off(airport)
    raise "Flight is cancelled due to stormy weather" if airport.weather_is_stormy
    airport.plane = nil
  end


end
