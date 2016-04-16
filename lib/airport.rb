class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land_plane(plane)
    plane.landed?
    @planes << plane
    "The plane has landed"
  end

  def take_off
  end

end
