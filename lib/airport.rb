require_relative 'plane'

class Airport

  def initialize
    @planes = []
  end

  def land(plane)
    plane.land
    @planes.push(plane)
  end


end
