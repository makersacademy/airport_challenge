class Airport
  DEFAULT_CAPACITY = 20
  attr_accessor :capacity

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    raise 'no space in airport' if full
    plane.flying = false
    @planes << plane
  end

  def full
    @planes.size >= capacity
  end

  def takeoff(plane)
    raise 'plane is already flying' if plane.flying
    raise 'plane cannot takeoff in a storm' if stormy?
    plane.flying = true
    @planes.delete(plane)
  end

  def at_airport?(plane)
    @planes.include?(plane)
  end

  def stormy?
    (rand(1..2) % 2).zero?
  end

end
