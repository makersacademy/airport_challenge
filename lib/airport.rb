require_relative 'plane'
require_relative 'weather'

class Airport
attr_accessor :capacity

DEFAULT_CAPACITY = 10

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def conditions
    @weather
  end

  def land(plane)
    fail "Too stormy" if conditions == "stormy"
    fail "Airport full" if @planes.count >= 10
    @planes << plane
  end

  def take_off(plane)
    fail "Too stormy" if conditions == "stormy"
    plane.landed = false
    plane
  end

end
