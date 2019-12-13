require_relative 'plane'

class Airport

  def initialize
    @landed_planes = []
  end

  def land_plane(plane)
    @landed_planes.push(plane)
    true
  end

  def take_off
    true
  end
end
