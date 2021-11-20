class Airport

  def initialize(capacity = 5)
    @planes = []
    @capacity = capacity
  end

  def land_plane
    fail "Landing not possible, airport is full" if @planes.count >= @capacity
    @planes << Plane.new
  end

  def plane_take_off
    "The plane is no longer in the airport"
  end
end
