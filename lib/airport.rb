require_relative 'plane'

class Airport

  attr_reader :capacity

  def initialize(capacity = 2)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'airport full' if full?

    @planes.push(plane)
  end

  def full?
    @planes.length >= @capacity
  end

  def take_off(plane)
    "no longer in airport"
  end

end
