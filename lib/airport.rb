require_relative 'plane'

class Airport

  def initialize
    @landed_planes = []
  end

  def let_land(plane)
    @landed_planes << plane
    plane
  end


end
