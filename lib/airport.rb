require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 100
  attr_reader :planes
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Airport full' if full?
    fail 'Cannot land when stormy' if stormy?
    @planes << plane
  end
  
  def take_off
    fail 'Cannot take off when stormy' if stormy?
    @planes.shift
  end

  def full?
    @planes.count >= @capacity
  end

  def stormy?
    Weather.new.stormy?
  end

end