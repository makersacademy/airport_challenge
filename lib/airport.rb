require 'plane'

class Airport
  attr_accessor :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail "Cannot land, airport full!" if @planes.length == @capacity
    @planes << plane
  end

  def take_off(plane)
  end

end  
