class Airport
  def initialize
    @planes = []
  end

  def land_plane(plane)
    fail "Plane already in airport" unless in_airport?(plane)

    @planes << plane
  end

  def take_off(plane)
    fail "Plane not in airport" unless in_airport?(plane)

    "The plane can take off."
  end

  def in_airport?(plane)
    @planes.include?(plane)
  end

end
