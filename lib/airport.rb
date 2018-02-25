class Airport

  def initialize
    @airport = []
  end

  def create_plane
    Plane.new
  end

  def plane_lands(plane)
    @current_plane = plane
    @airport << @current_plane
  end
end
