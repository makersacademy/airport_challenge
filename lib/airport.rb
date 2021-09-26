
require_relative 'plane'
class Airport
attr_reader :plane

  def initialize(capacity = 10)
    @capacity = 10
    @planes = []
  end

  def land(plane)
    fail "The airport is full!" if full?
    @planes << plane
    plane
  end

  def take_off(plane)
  @plane = plane
  @plane
  end

  private

  def full?
    @planes.length >= @capacity
  end
end

