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

  def accept_plane(plane)
    raise("Airport full -> can't accept planes!") if full?
    @planes.push(plane)
  end

  def plane_take_off
  end

end
