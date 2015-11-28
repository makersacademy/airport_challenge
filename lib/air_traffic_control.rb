require_relative 'airport'
require_relative 'plane'

class AirTrafficControl

  def instruct_landing(plane, airport)
    raise "The weather is too bad to land at #{airport.name}!" if airport.weather_is_stormy?
    raise "Can't land at #{airport.name}, it is full!" if airport.full?
    raise "This plane is not flying!" if plane.has_landed
    plane.has_landed = true
    airport.planes << plane
    "Plane #{plane.object_id} landed at #{airport.name}!"
  end

  def instruct_takeoff(plane, airport)
    raise "The weather is too bad to take off from #{airport.name}!" if airport.weather_is_stormy?
    raise "This plane is not at #{airport.name}!" if airport.planes.include?(plane) == false
    airport.planes.delete(plane)
    "Plane #{plane.object_id} just left #{airport.name}!"
  end

end
