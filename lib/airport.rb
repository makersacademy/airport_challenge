require_relative 'plane'
require_relative 'weather'

class Airport

attr_reader :planes
DEFAULT_CAPACITY = 50


  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    raise 'Cannot land, too stormy' if Weather.stormy?
    fail 'Cannot land, airport full' if @planes.length >= @capacity
    @planes << plane
    plane
  end

  def take_off(plane)
    raise 'Cannot take off, too stormy' if Weather.stormy?
    raise 'Plane not at airport' unless planes.include? plane
    @planes.delete(plane)
  end

  def set_capacity(capacity)
    @capacity = capacity
  end

end
