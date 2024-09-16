
require_relative 'plane'
class Airport
attr_reader :plane

  def initialize(capacity = 10)
    @capacity = 10
    @planes = []
  end

  def land(plane)
    raise 'The airport is full!' if full?
    raise 'You cannot land the weather is stormy' if stormy?
    @planes << plane
    plane
    
  end

  def take_off(plane)
    fail "You cannot take off the weather is stormy" if stormy?
    @plane = plane
    plane
  end

  private

  def full?
    @planes.length >= @capacity
  end

  def stormy?
  rand(1..6) > 5
  end
end

