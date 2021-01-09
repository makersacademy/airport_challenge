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
    fail "Cannot land, due to stormy weather" if stormy?
    @planes.push(plane)
  end

  def take_off
    fail "Cannot take off, due to stormy weather" if stormy?
    "#{@planes.pop} has taken off."
  end

  private

  def full?
    @planes.count >= capacity
  end

  def stormy?
    rand(1..10) > 9
  end
end
