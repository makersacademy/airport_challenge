require_relative 'plane'

class Airport
attr_reader :avail_planes

  def initialize
    @avail_planes = []
  end

  def plane_landing(plane)
    @avail_planes << plane
  end

  def plane_takeoff
    @avail_planes.pop
  end
end
