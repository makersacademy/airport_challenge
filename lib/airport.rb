require_relative 'plane'

class Airport
  attr_reader :plane
  def initialize(capacity)
    @capacity = capacity
    @planes = []
    # MAXIMUM CAPACITY = 20
  end

  def land(plane)
    raise "Airport Full" if full?
    raise "Cannot land plane: Weather stormy" if stormy?
    @planes.push(plane)
    # @plane = plane
  end

  def take_off(plane)
    # @planes.pop
  end

  private


  def stormy?
    rand(1..6) > 4
  end

  def full?
    @planes.length >= @capacity
  end
end
