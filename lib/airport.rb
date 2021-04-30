require_relative "plane"
 
class Airport
  attr_reader :planes
  attr_reader :capacity
  DEFAULT_CAPACITY = 10
    
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    raise "Landing Declined: Airport full" if @planes.length == capacity
    @planes.push(plane)
  end

  def take_off(plane)
    @planes.delete(plane)
    @planes
  end

  def return_planes
    @planes
  end
end
