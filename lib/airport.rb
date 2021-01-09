require_relative "plane"

class Airport

  STANDARD_CAPACITY = 10

  attr_reader :plane

  attr_accessor :capacity

  def initialize(capacity = STANDARD_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport is full" if full
    @planes.push(plane)
  end

  def take_off
    fail "Plane has taken off" if empty
    @plane.pop
  end

  private

  def empty
    @planes.empty?
  end

  def full
    @planes.count >= @capacity
  end

end