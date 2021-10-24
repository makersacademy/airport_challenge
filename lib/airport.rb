require_relative 'plane'

class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Too many Planes! No more space!" if full?
    @planes << plane
  end

  def take_off(plane)
    @planes.pop
    "Plane has departed from the airport"
  end

  private

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end
end