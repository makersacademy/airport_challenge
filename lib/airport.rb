class Airport

  DEFAULT_AIRPORT_CAPACITY = 10

  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_AIRPORT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Airport is full" if full?
    raise "Plane already in the airport" if present?(plane)

    @planes << plane
  end

  def take_off(plane)
    raise "Plane not in airport" unless present?(plane)

    @planes -= [plane]
  end

  private

  def full?
    @planes.size >= @capacity
  end

  def present?(plane)
    @planes.include?(plane)
  end

end
