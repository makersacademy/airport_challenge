require_relative 'airport'
require_relative 'plane'

class AirTrafficControl

  def land(plane, airport)
    if !plane.is_flying
      fail "This plane is already landed!"
    elsif airport.bad_weather?
      fail "Bad weather; can't land at #{airport.name}!"
    elsif airport.full?
      fail "#{airport.name} is full!"
    else
      plane.is_flying = false
      airport.planes << plane
      "Plane #{plane.object_id} landed at #{airport.name}!"
    end
  end

  def take_off(plane, airport)
    if !airport.planes.include?(plane)
      fail "This plane is not at #{airport.name}!"
    elsif airport.bad_weather?
      fail "Bad weather; the plane can't take off!"
    else
      plane.is_flying = true
      airport.planes.delete(plane)
      "Plane #{plane.object_id} just left #{airport.name}!"
    end
  end

end
