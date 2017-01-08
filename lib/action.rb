require_relative 'plane.rb'
require_relative 'airport.rb'
require_relative 'weather.rb'

class Action

  def land(plane, airport)
    raise "Weather is too stormy" if airport.stormy?
    raise "Airport is full" if airport.full?
    plane.land(airport)
    airport.land(plane)
  end

  def takeoff(plane, airport)
    raise "Weather is too stormy" if airport.stormy?
    plane.takeoff(airport)
    airport.takeoff(plane)
  end

end
