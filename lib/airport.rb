class Airport

  def initialize
    @landed_planes = []
  end

  def land(plane)
    fail "Airport is full" if full?

    @landed_planes << plane
  end

  def takeoff(plane)
    @landed_planes.delete(plane)
    "#{plane} has left the Airport"
  end

  private
  def full?
    !@landed_planes.empty?
  end
end
