require_relative 'plane'

class Airport
  
  attr_reader :planes
  
  DEFAULT_CAPACITY = 20
  
  def initialize 

    @planes = []
     
  end
  
  def land(plane)
    @planes = plane

  end

  def airport_full(plane)
    fail 'Airport full' if @planes.count >= DEFAULT_CAPACITY
    @planes << plane

  end

  def take_off
    @planes
  end

end
