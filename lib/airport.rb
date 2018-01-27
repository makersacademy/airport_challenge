class Airport

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Airport at capacity" if planes.length >= capacity
    raise "Too stormy to land" if stormy?
    planes << plane
  end

  def take_off(plane)
    raise "Too stormy to take off" if stormy?
    raise "Plane not in this airport" unless planes.include?(plane)
    planes.reject { plane }
  end

  private

  attr_reader :planes, :capacity

  def stormy?
    rand(2).zero?
  end

end
