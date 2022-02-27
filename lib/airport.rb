class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end 

  def land(plane)
    raise "Cannot land plane. Airport is full" if @planes.count >= capacity
    @planes << plane
  end

  def takeoff(plane)
    "Plane has taken off"
  end
end