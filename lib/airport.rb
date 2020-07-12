require_relative 'Plane'

class Airport
  attr_reader :capacity, :planes
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport full" if full?
    planes << plane
  end

  def take_off
    fail "No planes" if empty?
    planes.pop
  end

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end
end
