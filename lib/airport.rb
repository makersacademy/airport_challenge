class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land_a_plane(plane)
    @planes << plane
  end
end
