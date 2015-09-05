require_relative 'plane'

class Airport

  def initialize
    @planes = []
  end

  def clear_for_takeoff
    @planes.pop
  end

  def clear_for_landing(plane)
    plane.land
    @planes << plane
  end
end
