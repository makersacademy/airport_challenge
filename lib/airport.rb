require_relative 'plane'

class Airport
attr_reader :planes

  def intitalize
    @planes = []
  end

  def land_plane(plane)
    plane
  end

  def confirmation
    "A plane has landed"
  end

end
