require './lib/plane'

class Airport
  DEFAULT_CAPACITY = 50
  attr_reader :plane_capacity
  
  def initialize(plane_capacity = DEFAULT_CAPACITY)
    @planes = []
    @plane_capacity = plane_capacity
    @weather = stormy?
  end

  def land(arriving_plane)
    fail 'Too stormy to land' if stormy?
    fail 'No capacity at airport' if full?
    @planes << arriving_plane
    arriving_plane
  end

  def take_off
    fail 'Too stormy to take off' if stormy?
    @planes.pop
  end

  def full?
    @planes.count == @plane_capacity
  end

  def stormy?
    rand(1..5) > 3
  end
end
