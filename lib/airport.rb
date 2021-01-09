require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 20

  attr_reader :planes
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end
  def land(plane)
    fail "Airport is full" if full?
    @planes.push(plane)
  end

  def take_off
    "#{@planes.pop} has taken off."
  end

  def full?
    @planes.count >= capacity
  end
end
