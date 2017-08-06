class Airport

  DEFAULT_CAPACITY = 50

  attr_reader :plane, :planes, :capacity

  def initialize(cap = DEFAULT_CAPACITY)
    @plane = plane
    @planes = []
    @capacity = cap
  end

  def land_plane(plane)
    raise 'Plane already landed' if plane.landed == true
    raise 'Airport at capacity' if full?
    plane.landed = true
    @planes << plane
    plane
  end

  def takeoff
    raise 'No planes available' if empty?
    @takeoff = @planes[0]
    @planes.delete_at(0)
    @takeoff.takeoff
  end

  def full?
    @planes.length == @capacity
  end

  def empty?
    @planes.empty?
  end

end