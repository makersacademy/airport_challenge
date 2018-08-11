class Airport
  DEFAULT_CAPACITY = 20
  attr_accessor :capacity

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    raise 'plane cannot land in a storm' if stormy?
    raise 'plane is already landed' unless plane.flying
    raise 'no space in airport' if full
    # raise 'plane cannot land in a storm' if stormy?
    plane.flying = false
    @planes << plane
  end

  def full
    @planes.size >= capacity
  end

  def takeoff(plane)
    raise 'plane cannot takeoff in a storm' if stormy?
    raise 'plane is already flying' if plane.flying
    plane.flying = true
    @planes.delete(plane)
  end

  def at_airport?(plane)
    @planes.include?(plane)
  end

  def stormy?
    (rand(1..7) % 7).zero?
  end

end
