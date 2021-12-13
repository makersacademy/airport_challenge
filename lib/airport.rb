

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end
  
  def land(plane)
    raise 'Airport full' if planes.count >= 30
    planes << plane
  end

  def take_off
    planes.pop
  end
end
