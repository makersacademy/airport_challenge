require_relative 'plane'
# Airport class
class Airport
  attr_reader :landed_planes
  def initialize
    @landed_planes = []
  end

  def land_plane(plane)
    @landed_planes << plane
  end

  def fly_plane
    @landed_planes.pop
  end
end
