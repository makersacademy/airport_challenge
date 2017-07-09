class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

  def land(plane)
    planes << plane
  end

  def in_airport?(plane)
    planes.include? plane
  end

  def takeoff(plane)
    planes.delete(plane)
  end

end
