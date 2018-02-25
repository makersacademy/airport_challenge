class Airport

  def initialize
    @airport = []
  end

  def create_plane
    Plane.new
  end

  def plane_lands(plane)
    @airport << plane
  end

  def plane_takeoff
    @airport.pop
  end
end
