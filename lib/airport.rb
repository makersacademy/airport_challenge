require_relative 'weather'
# require_relative 'plane_container'

class Airport
  attr_reader :capacity, :airport_planes
  include Weather
  # include PlaneContainer

  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @ground_planes = []
    @capacity = capacity
    # setup_plane_list
  end

  def airport_planes
    @ground_planes.dup
  end

  def full?
    true if @ground_planes >= @capacity
    false
  end

  def land(plane)
    @ground_planes << plane
  end

  def takeoff(plane)
    @ground_planes.delete(plane)
  end

end
