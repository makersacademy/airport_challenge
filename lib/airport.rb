require_relative 'plane'
require_relative 'weather'

class Airport
  include Weather

  def initialize
    @planes = []
    @capacity = 10
  end

  def land plane
    fail "Cannot land during a storm" if stormy?
    if full?
      fail "Airport is full"
    else
      (plane.landed = true) && (plane.flying = false)
      planes << plane
    end
  end

  def take_off plane
    fail "Storm brewing" if stormy?
    plane.flying = true
    plane.landed = false
    planes.delete(plane)
  end

  attr_accessor :planes

  def full?
    planes.count >= @capacity
  end
end