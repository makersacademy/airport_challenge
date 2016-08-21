require_relative 'plane'

class Airport

  attr_reader :landed_planes
  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "#{self} is currently at full capacity" if full?
    fail "Plane cannot land due to stormy conditions" if stormy?
    landed_planes << plane
    "#{plane} has landed"
  end

  def take_off(plane)
    fail 'Plane cannot take off due to a stormy conditions' if stormy?
    landed_planes.delete(plane)
    "#{plane} has taken off from #{self}"
  end

  def stormy?
    true if rand(5) == 0
  end

  def full?
    true if landed_planes.length >= capacity
  end

end
