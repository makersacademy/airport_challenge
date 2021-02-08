require_relative('planes.rb')

class Airport
  DEFAULT_CAPACITY = 3
  attr_reader :planes, :capacity

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def plane_landing(plane)
    fail "airport full" if airport_full?
    plane.land
    @planes << plane
  end

  def taking_off
    @planes.pop
  end

  def airport_full?
    @planes.count >= @capacity
  end
end
