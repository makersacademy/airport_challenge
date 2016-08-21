require_relative 'planes'

class Airport

attr_reader :capacity

def initialize (capacity = 2)
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
    @planes.count >= 2
  end
end
