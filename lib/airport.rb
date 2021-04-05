require_relative 'plane'
require_relative 'errors'

class Airport
  DEFAULT_CAPACITY = 30
  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    full?
    plane.land_plane
    @planes << plane 
  end

  def takeoff(plane)
    empty?
    planes.delete(plane)
    plane.takeoff_plane
    plane
  end

  private
  def full?
    raise LandingError if @planes.size >= DEFAULT_CAPACITY
  end

  def empty?
    raise TakeOffError if @planes.empty?
  end

end
