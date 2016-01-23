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
    fail "Plane does not have clearance to land" if plane.clearance == false
    @landed_planes << plane
  end

  def reset_clearance
    @landed_planes.each {|plane| plane.request_clearance(self)}
  end

end
