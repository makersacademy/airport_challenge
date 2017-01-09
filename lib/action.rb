require_relative 'plane.rb'
require_relative 'airport.rb'
require_relative 'weather.rb'

class Action

  def land(plane, airport)
    raise "Weather is too stormy" if airport.stormy?
    raise "Airport is full" if airport.full?
    raise "Plane already at an airport" if plane.current_airport!=nil
    plane.land(airport)
    airport.land(plane)
  end

  def takeoff(plane, airport)
    raise "Weather is too stormy" if airport.stormy?
    raise "Plane not at airport" if !airport.planes.include?(plane)
    plane.takeoff(airport)
    airport.takeoff(plane)
  end

  def land_multiple(planes, airport)
    raise "Weather is too stormy" if airport.stormy?
    raise "Airport is full" if airport.full?
      planes.each do |plane|
        raise "Plane already at an airport" if plane.current_airport!=nil
        plane.land(airport)
        airport.land(plane)
      end
  end

  def takeoff_multiple(planes, airport)
    raise "Weather is too stormy" if airport.stormy?
      planes.each do |plane|
        raise "Plane not at airport" if !airport.planes.include?(plane)
        plane.takeoff(airport)
        airport.takeoff(plane)
      end
  end
end
