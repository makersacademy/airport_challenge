class Airport

  def initialize
    @planes = []
  end

  def land_plane plane
    plane.land
    @planes << plane
  end

end
