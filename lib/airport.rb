require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT = 40
  def initialize(capacity = DEFAULT)
    @capacity = capacity
    @planes = []
  end 

  def receive(plane)
    raise 'Airport is at maximum capacity.' if max_capacity?
    @planes << plane
  end

  def allow_take_off(plane)
    @planes.delete(plane)
  end

  def max_capacity?
    @planes.count >= @capacity
  end

  def plane_count
    @planes.count
  end

end