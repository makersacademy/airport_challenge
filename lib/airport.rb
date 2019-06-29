class Airport
  def initialize
    @planes = []
  end

  def land_plane(plane)
    @planes << plane
    plane
  end

  def takeoff_plane
    fail 'No planes available for takeoff' if @planes.empty?

    @planes.pop
    'Plane has taken off'
  end
end
