require_relative 'plane'
require_relative 'weather'

class Airport
  include Weather

  def initialize
    @planes = []
    @capacity = 10
  end

  def land plane
    fail "Plane already landed" if planes.include?(plane)
    fail "Cannot land during a storm" if stormy?
    if full?
      fail "Airport is full"
    else
      plane.flying = false
      planes << plane
    end
  end

  def take_off plane
    fail "Storm brewing" if stormy?
    fail "Plane already flying" unless planes.include?(plane)
    plane.flying = true
    planes.delete(plane)
  end

  attr_accessor :planes

  def full?
    planes.count >= @capacity
  end
end