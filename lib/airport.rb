require_relative 'plane'

class Airport
DEFAULT_CAPACITY = 100
attr_reader :planes
attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def take_off
    @planes.pop
  end

  def land(plane)
    fail 'Airport full' if full?
    @planes << plane
  end

  def full?
    @planes.length >= @capacity ? true : false
  end

end
