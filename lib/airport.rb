require_relative "plane"

class Airport

  DEFAULT_CAPACITY = 5

  def initialize
    @planes = []
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
    @planes.count >= DEFAULT_CAPACITY
  end

end
