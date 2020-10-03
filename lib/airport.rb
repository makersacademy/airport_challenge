require_relative "weather"
require_relative "plane"

class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :capacity, :landed_planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @landed_planes = []
  end

  def land(plane)
    fail 'The airport is at max capacity' if landed_planes.count == capacity
    landed_planes << plane
  end
end