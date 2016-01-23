require_relative 'plane'

class Airport

  def initialize
    @landed_planes = []
  end

  def landed_planes
    @landed_planes.dup
  end

  def clearance?
    true
  end

  def plane_lands(plane)
    raise "Plane does not have clearance to land" if plane.clearance == false
    @landed_planes << plane
  end

end
