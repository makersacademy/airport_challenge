class Airport

  attr_reader :capacity, :planes
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def full?
    @planes.length == @capacity
  end

  def land(plane)
    raise("Airport full -> can't accept planes!") if full?
    plane.land
    @planes.push(plane)
  end

  def take_off(plane)
    plane.take_off
    @planes.shift
  end

end
