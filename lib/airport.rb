require_relative 'plane'

class Airport

  def initialize
    @planes = []
  end

  def land_plane (plane)
    @planes << plane
    plane.takenoff = false
    plane.landed = true
    plane
  end

  def takeoff_plane (plane)
    @planes.pop
    plane.takenoff = true
    plane.landed = false
    plane
  end

end
