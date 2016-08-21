require_relative 'plane'

class Airport

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def takeoff(plane)
    @planes.pop
  end


end
