class Airport

  attr_reader :planes, :weather

  def initialize
    @planes = []
    @weather = false
  end

  def land(plane)
    raise("plane already landed") if plane.landed == true
    plane.landed = true
    @planes << plane
  end

  def take_off(plane)
    raise("plane already took off ") if plane.landed == false
    raise("this plane is not landed in this airport") if !planes.include?(plane)
    plane.landed = false
    @planes.delete(plane)
  end


end
