require_relative 'airport'
require_relative 'plane'

class AirTrafficControl

  def instruct_landing(plane, airport)
    if !plane.is_flying
      fail "This plane is already landed!"
    elsif airport.weather_is_stormy?
      fail "The weather is too bad to land at #{airport.name}!"
    elsif airport.full?
      fail "Can't land at #{airport.name}, it is full!"
    else
      plane.is_flying = false
      airport.planes << plane
      "Plane #{plane.object_id} landed at #{airport.name}!"
    end
  end

  def instruct_takeoff(plane, airport)
    if !airport.planes.include?(plane)
      fail "This plane is not at #{airport.name}!"
    elsif airport.weather_is_stormy?
      fail "The weather is too bad to take off from #{airport.name}!"
    else
      plane.is_flying = true
      airport.planes.delete(plane)
      "Plane #{plane.object_id} just left #{airport.name}!"
    end
  end

end
