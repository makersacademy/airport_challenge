class Airport

  def initialize(capacity = 20)
    @planes = []
    @capacity = capacity
  end

  def clear_landing(plane)
    raise "Airport is at capacity" if @planes.count == @capacity
    @planes << plane
  end

  def has_plane?(plane)
    @planes.include?(plane)
  end

  def clear_takeoff(plane)
    raise "Plane is not at this airport" unless has_plane?(plane)
    @planes.delete(plane)
  end
end