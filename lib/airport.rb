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
    fail 'The airport is at max capacity' if full?
    fail 'This plane has already landed' if landed?(plane)
    landed_planes << plane
  end

  private

  def full?
    landed_planes.count == capacity
  end
  
  def landed?(plane)
    landed_planes.include?(plane)
  end

end