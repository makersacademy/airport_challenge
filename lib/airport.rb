require_relative './plane.rb'

class Airport

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
    self
  end

  def takeoff(plane)
    @planes.delete(plane)
  end

  def planes
    @planes
  end

end
