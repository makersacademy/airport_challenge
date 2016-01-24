require_relative 'plane_container'
require_relative 'airplane'

class Airport
  attr_reader :capacity, :airport_planes, :DEFAULT_CAPACITY
  include PlaneContainer

  DEFAULT_CAPACITY = 100

  def airport_planes
    @list_planes.dup
  end

  def land(plane)
    plane.report_landed(self)
    plane_in(plane)
  end

  def takeoff(plane)
    plane.report_inflight
    plane_out(plane)
  end
end
