class Airport

  attr_reader :capacity, :weather, :planes

  def initialize
    @capacity = 20
    @weather = "nice"
    @planes = []
  end

  def accept_plane(plane)
    @planes << plane
  end

  def plane_departs(plane)
    @planes.delete(plane)
  end

  def plane_present(plane)
    @planes.include? plane
  end

end
