class Airport

  DEFAULT_CAPACITY = 10
  attr_accessor :capacity

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def print_planes
    @planes
  end

  def land_plane(plane)
    raise 'Airport is full' if airport_full?

    @planes << plane
  end

  def take_off_plane
    @planes.pop
  end

  def airport_full?
    @planes.count >= capacity
  end

end
