require_relative 'plane'

class Airport

  attr_reader :capacity

  DEFAULT_CAPACITY = 2
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'airport full' if full?

    @planes.push(plane)
  end

  def take_off(plane)
    "no longer in airport"
  end

  def full?
    @planes.length >= @capacity
  end
end
