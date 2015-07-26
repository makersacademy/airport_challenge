class Airport

  def initialize
    @planes = []
  end

  def allow_to_land(plane)
     plane.land
     @planes << plane
  end

  def allow_to_takeoff(plane)
    plane.takeoff
  end

  attr_reader :planes

end
