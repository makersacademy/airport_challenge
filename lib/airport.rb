class Airport
  DEFAULT_CAPACITY = 100
  attr_reader :planes
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
  @planes = []
  @capacity = capacity
  end

  def land(plane)
    raise "Airport full" if full?
    raise "Plane has already landed in the airport" if exist?(plane)
    raise "It is too stormy to land" if stormy?
    @planes << plane
    plane.land
  end

  def take_off(plane)
    raise "Plane can't take off if it has not landed at the airport" unless exist?(plane)
    raise "It is too stormy to take off" if stormy?
    @planes.delete(plane)
    plane.take_off
  end

  private
  def full?
    @planes.length >= capacity
  end

  def exist?(plane)
    @planes.include?(plane)
  end

  def stormy?
    rand(4) == 1
  end

end
