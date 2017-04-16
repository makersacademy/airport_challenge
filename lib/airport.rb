class Airport

  CAPACITY = 20

  attr_reader :capacity, :planes

  def initialize(capacity = CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def receive(plane)
    raise "Airport is at capacity" if full?
    @planes << plane
  end

  def release(plane)
    raise "Plane is not at that airport" unless planes.include?(plane)
    @planes.delete(plane)
  end

  def full?
    @planes.count == capacity
  end

end
