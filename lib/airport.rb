require_relative 'plane'

class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail "The airport is full, cannot allow landing" if @planes.length >= DEFAULT_CAPACITY
    @planes << plane
  end

  def take_off(plane)
    @planes.pop
  end

end
