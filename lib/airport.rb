require_relative "plane"

class Airport
  MAX_CAPACITY = 10

  attr_reader :planes, :capacity
  
  attr_accessor :capacity

  def initialize(capacity=MAX_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    fail "Airport full" if full?
    fail "Stormy weather" if stormy?
    planes << plane
  end

  def takeoff_plane
    fail "Stormy weather" if stormy?
    planes.pop
  end

  private

  def full?
    planes.count >= capacity
  end

  def stormy?
    rand(1..10) > 9
  end
end
