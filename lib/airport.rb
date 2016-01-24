require_relative 'weather'
require_relative 'plane_container'
require_relative 'airplane'

class Airport
  attr_reader :capacity, :airport_planes
  include Weather
  include PlaneContainer

  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    # @ground_planes = []
    @capacity = capacity
    setup_plane_list
  end

  def airport_planes
    # @ground_planes.dup
    @list_planes.dup
  end

  # def full?
  #   # @ground_planes.length >= @capacity ? true : false
  #   @list_planes.length >= @capacity ? true : false
  # end

  def land(plane)
    # @ground_planes << plane
    plane.report_landed(self)
    plane_in(plane)
  end

  def takeoff(plane)
    # @ground_planes.delete(plane)
    plane.report_inflight
    plane_out(plane)
  end

end
