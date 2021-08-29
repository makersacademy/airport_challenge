require_relative 'plane'

class Airport
  attr_reader :planes
  attr_reader :capacity

  DEFAULT_CAPACITY = 10

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def landing(plane)
    fail 'Airport is full' if full?
    @planes << plane
  end

  def take_off(plane)
    @planes.pop
    "Plane has taken off"
  end

  private

  def full?
    @planes.count >= @capacity
  end
end