class Airport
  attr_reader :planes, :capacity

  def initialize
    @planes = []
  end

  def land(planes)
  end

  def full?
    fail "Airport is full" if @planes.count >= @capacity
  end
  def stormy?
    fail "The weather is stormy!No landing or takeoff!" if @weather_conditions == "stormy"

  end
end
