require_relative 'plane'

class Airport
  attr_reader :plane
  def initialize(capacity)
    @capacity = capacity
    @planes = []
    # MAXIMUM CAPACITY = 20
  end

  def land(plane)
    raise "Airport Full" if @planes.length >= @capacity
    @planes.push(plane)
    # @plane = plane
  end

  def take_off(plane)
    # @plane
  end
end
