require_relative 'airport.rb'

class Plane

  def land(airport)
    raise "Plane can not land due to stormy weather" if airport.weather_is_stormy
    airport.plane = self
  end

  def take_off(airport)
    raise "Plane can not take off due to stormy weather" if airport.weather_is_stormy
    airport.plane = nil
  end


end
