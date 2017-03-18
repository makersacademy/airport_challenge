require_relative 'plane'

class Airport
attr_reader :planes

  def initialize
    @planes = []
  end

  def land_plane(plane)
    @planes << plane
  end

  def confirmation
    "A plane has landed"
  end

end
