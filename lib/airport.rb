require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :capacity

  include Weather

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end


  def take_off(plane)
    raise "Plane cannot take off during storm" if stormy?
    raise "Plane cannot be found in this airport" unless plane_exists?(plane)
    plane.flying = true
    @planes.delete(plane)
  end

  def land(plane)
    raise "Airport full" if full?
    raise "Cannot land plane when stormy" if stormy?
    raise "Plane already landed" if plane_exists?(plane)
    plane.flying = false
    @planes << plane
    self
  end

  def full?
    @planes.count >= capacity
  end

  def plane_exists?(plane)
    @planes.include?(plane)
  end
end
