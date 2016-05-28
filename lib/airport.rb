require_relative "plane"

class Airport

  DEFAULT_CAPACITY = 5
  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  attr_reader :plane

  def land(plane)
    fail "Airport is full" if full?
    @planes << plane
  end

  def depart(plane)
    fail "No planes at airport" if empty?
    @planes.pop
  end

  def empty?
    @planes.empty?
  end

  def full?
    @planes.count >= capacity
  end

end
