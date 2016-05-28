require_relative "plane"

class Airport

  DEFAULT_CAPACITY = 5
  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @plane_park = []
    @capacity = capacity
  end

  attr_reader :plane

  def land(plane)
    fail "Airport is full" if full?
    @plane_park << plane
  end

  def depart(plane)
    fail "No planes at airport" if empty?
    @plane_park.pop
  end

  private

  def empty?
    @plane_park.empty?
  end

  def full?
    @plane_park.count >= capacity
  end

end
