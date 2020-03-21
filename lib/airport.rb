require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 50
  def initialize
    @planes = []
  end

  def land(plane)
    fail 'Airport full' if full?

    @planes << plane
    true
  end

  def take_off(plane)
    true
  end

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

end
