require_relative 'airport'
require_relative 'plane'

class AirTrafficControl

  def instruct_landing(plane, airport)
    raise "The weather is too bad to land at #{airport}!" if airport.weather_is_stormy?
    airport.planes << plane
    "Plane #{plane.object_id} landed at #{airport}!"
  end

  def instruct_takeoff(plane, airport)
    raise "The weather is too bad to take off!" if airport.weather_is_stormy?
    airport.planes.delete(plane)
    "Plane #{plane.object_id} just left #{airport}!"
  end

private


end
