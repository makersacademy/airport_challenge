class Airport
  attr_reader :capacity

  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def take_off(plane)
    @planes.delete(plane)
    @plane = plane
  end

  def land(plane)
    @plane = plane
    @planes << plane
    # puts "#{Plane} has landed"
    @plane
  end

end
