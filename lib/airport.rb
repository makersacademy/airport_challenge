require_relative 'plane'

class Airport

  attr_reader :capacity
  attr_reader :landed_planes
  DEFAULT_CAPACITY = 50

  def initialize capacity = DEFAULT_CAPACITY
    @capacity = capacity
    @landed_planes = []
  end

  def let_take_off plane
    plane.take_off
    @landed_planes.delete(plane)
  end

  def let_land plane
    plane.land
    @landed_planes << plane
  end

end

