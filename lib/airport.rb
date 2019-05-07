class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Cannot land: Plane is already at Airport" if at_airport?(plane)
    raise "Cannot land: Airport is full" if full?
    raise "Cannot land in stormy weather" if Weather.stormy?

    @planes << plane
  end

  def take_off(plane)
    raise "Cannot take off: Plane is not at Airport" unless at_airport?(plane)
    raise "Cannot take off in stormy weather" if Weather.stormy?

    @planes.delete(plane)
  end

  private

  def full?
    @planes.size >= capacity
  end

  def at_airport?(plane)
    @planes.include?(plane)
  end
end
