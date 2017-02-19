require_relative 'plane'
require_relative 'weather'

class Airport

DEFAULT_CAPACITY = 50

include Weather

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    raise 'Cannot land, too stormy' if stormy?
    fail 'Cannot land, airport full' if @planes.length >= @capacity
    @planes << plane
    plane
  end

  def take_off
    raise 'Cannot take off, too stormy' if stormy?
    @planes.pop
    # plane
  end

  def set_capacity(capacity)
    @capacity = capacity
  end


end
