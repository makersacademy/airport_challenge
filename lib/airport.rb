class Airport

  CAPACITY = 20

  attr_reader :capacity, :planes

  def initialize(capacity = CAPACITY)
    raise "Capactiy must be an integer" unless capacity.is_a?(Integer)
    raise "Capactiy must be greater than zero" unless capacity > 0
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

  private

  attr_reader :planes

end
