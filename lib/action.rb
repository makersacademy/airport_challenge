# Action class
require 'weather.rb'
require 'airport.rb'
require 'plane.rb'

class Action

  #actions are takeoff and land

  def land(plane, airport)
    raise "Weather is too stormy" if airport.weather.stormy?
    raise "Airport is full" if airport.full?
    plane.land(airport)
    airport.land(plane)
  end

  def takeoff(plane, airport)
    raise "Weather is too stormy" if airport.weather.stormy?
    plane.takeoff(airport)
    airport.takeoff(plane)
  end


end
