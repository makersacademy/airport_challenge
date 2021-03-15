require_relative 'plane'
require_relative 'weather'

class Airport
  def initialize(capacity = 40)
    @capacity = capacity
  end 
  
  def planes
    @planes = []
    p @planes
  end 

  def receive(plane)
    raise 'Airport is at maximum capacity.' if max_capacity?
    @planes << plane
    planes.count -= 1
  end

  def allow_take_off(plane)
    planes.delete(plane)
    planes.count -= 1
  end

  def max_capacity?
    planecount >= @capacity
  end

  def plane_count
    planes.count
  end

end