require_relative 'plane'

class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 50
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "The airport is full" if full?
    @plane = plane
    @planes << @plane
  end

  def take_off
    @planes.pop
  end

  private
  def full?
    @planes.count >= DEFAULT_CAPACITY
  end
end