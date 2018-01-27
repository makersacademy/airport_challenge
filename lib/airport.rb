require_relative 'plane'
class Airport
  attr_reader :landed_planes
  def initialize
    @landed_planes = []
  end

  def land_plane(plane)
    @landed_planes << plane
  end
end
