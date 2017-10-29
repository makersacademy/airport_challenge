class Airport

  attr_reader :planes, :weather

  def initialize
    @planes = []
    @weather = false
  end

  def land(plane)
    raise("plane already landed") if plane.landed == true
    @planes << plane 
  end

  def take_off(plane)
    @planes.delete(plane)
  end


end
