require './lib/plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land_plane(plane)
    @planes << plane
    confirm_plane_landing(plane)
  end

  def confirm_plane_landing(plane)
    "Plane #{plane} has landed"
  end

end
