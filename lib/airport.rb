class Airport
  def initialize
    @planes = []
  end

  def land_plane(plane)
    fail "Plane already in airport" unless in_airport?(plane)
    
    @planes << plane
  end

  def in_airport?(plane)
    @planes.include?(plane)
  end

end
