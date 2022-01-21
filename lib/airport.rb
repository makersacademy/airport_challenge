class Airport

  def initialize(capacity)
    @capacity = capacity
    @planes = []

  end

  def land(plane)
    raise "Plane cannot land. Airport is full" if @planes.count >= @capacity
    @planes << plane
  end

  def take_off(plane)
  end

end