class Airport

  def initialize
    @planes = []
  end

  def land_plane plane
    plane.land
    @planes << plane
  end

  def take_off_plane plane
    plane.take_off
    @planes.delete plane
  end

end
