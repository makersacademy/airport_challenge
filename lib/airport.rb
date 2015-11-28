require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def tell_plane_to_land(plane)
    planes << plane
  end

end
