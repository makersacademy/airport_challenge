class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Cannot land: Airport is full" if full?
    raise "Cannot land in stormy weather" if Weather.stormy?

    @planes << plane
  end

  def take_off(plane)
    raise "Cannot take off in stormy weather" if Weather.stormy?

    @planes.delete(plane)
  end

  private

  def full?
    @planes.size >= DEFAULT_CAPACITY
  end
end
