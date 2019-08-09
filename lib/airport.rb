class Airport
  attr_reader :planes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 100

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    raise "Airport full" if full?

    raise "Plane already landed" if @planes.include?(plane)

    @planes << plane
  end

  def takeoff(plane)
    raise "Plane is not in the airport" unless @planes.include?(plane)

    @planes.delete(plane)
  end

  def full?
    @planes.count >= @capacity
  end
end
