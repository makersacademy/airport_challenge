require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 50
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport full' if full?

    @planes << plane
    true
  end

  def take_off(plane)
    true
  end

  private

  def full?
    @planes.count >= @capacity
  end

end
