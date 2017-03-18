require_relative 'plane'

class Airport
attr_reader :planes, :weather

  def initialize
    @planes = []
  end

  def plane_land(plane)
    @planes << plane
    confirmation_land
  end

  def plane_takeoff
    fail if stormy?
    @planes.pop
    confirmation_takeoff
  end

  def confirmation_land
    "A plane has landed"
  end

  def confirmation_takeoff
    "Plane has taken off"
  end

  def stormy?
    [false, false, false, true].sample
  end

end
