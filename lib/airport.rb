require_relative 'plane'

class Airport

  def initialize
    @landed_planes = []
  end

  def clearance?
    true
  end

  def plane_lands(plane)
    @landed_planes << plane
  end

end
