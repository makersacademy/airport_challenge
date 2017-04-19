require_relative 'planes'
require_relative 'weather'

class Airport

attr_reader :capacity

DEFAULT_CAPACITY = 100

def initialize (capacity = DEFAULT_CAPACITY)
@planes = []
@capacity = capacity
end

  def take_off(plane)
  end

  def land(plane)
    fail 'The airport is full' if full?
    fail 'its too stormy to land' if Weather.stormy?
    @planes << plane
  end

  private

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end
end
