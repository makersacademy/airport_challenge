require_relative 'planes'

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
    @planes << plane
  end

  private

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end
end
