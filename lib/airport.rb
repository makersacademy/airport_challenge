require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
    plane.landed
  end

  def takeoff(plane)
    @planes.delete_at(@planes.index(plane))
    plane.flying
  end

end
