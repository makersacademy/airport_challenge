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
    @planes << plane
    plane.land
  end

  def take_off(plane)
    raise "There are no planes to take off" if empty?
    @planes.delete(plane)
    plane.take_off
  end

  private
  def full?
    @planes.length >= capacity
  end

  def empty?
    @planes.empty?
  end

  def exist?(plane)
    @planes.include?(plane)
  end

end
