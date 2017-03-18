require_relative 'plane'

class Airport
attr_reader :planes

  def initialize
    @planes = []
  end

  def plane_land(plane)
    @planes << plane
    confirmation_land
  end

  def plane_takeoff
    @planes.pop
  end

  def confirmation_land
    "A plane has landed"
  end

  def confirmation_takeoff
    "A plane has taken off"
  end

end
