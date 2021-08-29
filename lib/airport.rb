require_relative "plane"

class Airport
  
  attr_reader :planes
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Hangar is full, can't land" if full?
    @planes << plane
  end

  def take_off(plane)
    @planes.delete(plane)
  end

  private

  def full?
    @planes.count >= @capacity
  end
end
