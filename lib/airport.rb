require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 50
  def initialize
    @planes = []
  end

  def land(plane)
    fail 'Airport full' if @planes.count >= DEFAULT_CAPACITY
    
    @planes << plane
    true
  end

  def take_off(plane)
    true
  end

end
