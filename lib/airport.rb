require_relative 'plane'

class Airport
  attr_reader :planes, :capacity
  def initialize(capacity = 50)
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
    @planes.count >= 50
  end
end