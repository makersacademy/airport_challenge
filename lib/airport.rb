class Airport
  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Plane is unable to land: airport is full' if @planes.length >= @capacity
    @planes << plane
  end

  def takeoff(plane)
  end
end
