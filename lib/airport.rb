
class Airport

  def initialize
    @hangar = []
  end

  def runway_land(plane)
    @hangar << plane
  end

  def runway_takeoff(plane)
    @hangar -= [plane]
  end

end