require_relative 'plane'

class Airport
  attr_reader :capacity, :planes
  DEFAULT_CAPACITY = 30
  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail "Abort! No room for landing" if @planes.count >= capacity
    planes << plane
  end

  def take_off
    planes.pop
  end

end
