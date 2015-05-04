require_relative 'plane'
require_relative 'weather'

class Airport
  include Weather

  def initialize
    @planes = []
    @capacity = 6
  end

  def land plane
    fail "Cannot land during a storm" if stormy?
    fail "Plane already landed" if planes.include?(plane)
    fail "Airport is full" if full?
    plane.flying = false
    planes << plane
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