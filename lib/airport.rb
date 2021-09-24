class Airport

  DEFAULT_CAPACITY = 20

  def initialize
    @planes = []
  end

  attr_reader :planes

  def land(plane)
    raise "Airport is full" if @planes.count >= DEFAULT_CAPACITY
    plane.flying = false
    @planes << plane
  end

  def take_off(plane)
    plane.flying = true
    @planes.delete(plane)
  end
end
