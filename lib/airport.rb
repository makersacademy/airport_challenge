class Airport

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  attr_reader :planes

  def land(plane)
    raise "Airport is full" if @planes.count >= @capacity
    plane.flying = false
    @planes << plane
  end

  def take_off(plane)
    plane.flying = true
    @planes.delete(plane)
  end
end
