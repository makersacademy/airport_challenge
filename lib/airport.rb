require 'plane'

class Airport

  DEFAULT_CAPACITY = 20
  attr_accessor :capacity, :planes

  def initialize
    @capacity = DEFAULT_CAPACITY
    @planes = []
  end

  def instruct_takeoff(plane)
    plane.takeoff(self)
  end

  def instruct_land(plane)
    plane.land(self)
  end

  def request_land?(plane)
    fail 'Airport full' if full?
    planes << plane
    true
  end

  def request_takeoff?(plane)
    return true if (planes.delete(plane) == plane)
    false
  end

private

 def full?
   planes.length >= capacity
 end


end
