class Airport 
  attr_reader :planes, :capacity

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def take_off
    
  end

end