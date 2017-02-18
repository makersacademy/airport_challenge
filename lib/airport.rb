require_relative 'plane'

class Airport

DEFAULT_CAPACITY = 50

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    fail 'Cannot land, airport full' if @planes.length >= @capacity
    @planes << plane
    plane
  end

  def take_off
    @planes.pop
  end

  def set_capacity(capacity)
    @capacity = capacity
  end

end
