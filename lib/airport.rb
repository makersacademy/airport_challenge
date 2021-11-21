require_relative 'plane'
class Airport  
  attr_reader :plane, :capacity
  
  def initialize(capacity = 5)
    @planes = []
    @capacity = capacity

  end

  def land(plane)
    fail "Airport is Full" if @planes.count >= @capacity
    @planes.push(plane) 
  end

  def take_off(*)
    "Plane has taken off"
  end

end

