require_relative 'plane'
require_relative 'weather'

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
    fail 'Weather too stormy for take off' if Weather.stormy?
  end

  def land(plane)
    fail 'Airport full' if full?
    #fail 'Weather too stormy for take off' if stormy?
    @planes << plane
  end

  def full?
    @planes.length >= @capacity ? true : false
  end

end
