require_relative 'airplane'
require_relative 'airport'
require_relative 'weather'
require_relative 'plane_container'

class AirTrafficControl
  include PlaneContainer

  DEFAULT_CAPACITY = 500

  def display_inflight
    @list_planes.dup
  end

  def instruct_land(plane, airport)
    raise 'Plane already landed' if airplane_status_check(plane, true)
    raise 'Too stormy to land' if bad_weather?
    raise 'Airport is full' if airport.full?
    airport.land(plane)
    plane_out(plane)
  end

  def instruct_takeoff(plane, airport)
    raise 'Plane already inflight' if airplane_status_check(plane,false)
    raise 'Plane is not located here' if airport_match(plane, airport) == false
    raise 'Too stormy to take-off' if bad_weather?
    airport.takeoff(plane)
    plane_in(plane)
  end

  private

  def airport_match(plane, airport)
    plane.location == airport_match ? true : false
  end

  def airplane_status_check(plane, status)
    plane.landed == status
  end

  def bad_weather?
    Weather.new.stormy?
  end
end
