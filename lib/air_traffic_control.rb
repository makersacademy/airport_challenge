require_relative 'airplane'
require_relative 'airport'
require_relative 'weather'
require_relative 'plane_container'

class AirTrafficControl
  include Weather
  include PlaneContainer

  def initialize
    # @inflight = []
    setup_plane_list
  end

  def display_inflight
    # @inflight.dup
    @list_planes.dup
  end

  def instruct_land(plane, airport)
    raise 'Plane already landed' if airplane_status_check(plane, true)
    raise 'Too stormy to land' if stormy?
    raise 'Airport is full' if airport.full?
    airport.land(plane)
    # plane.report_landed(airport)
    # @inflight.delete(plane)
    plane_out(plane)
  end

  def instruct_takeoff(plane, airport)
    raise 'Plane already inflight' if airplane_status_check(plane,false)
    raise 'Plane is not located here' if airport_match(plane, airport) == false
    raise 'Too stormy to take-off' if stormy?
    airport.takeoff(plane)
    # plane.report_inflight
    # @inflight << plane
    plane_in(plane)
  end

  private

  def airport_match(plane, airport)
    plane.location == airport_match ? true : false
  end

  def airplane_status_check(plane, status)
    plane.landed == status
  end


end
