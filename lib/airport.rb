class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :capacity

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def take_off(plane)
    @planes.pop
  end

  def land_plane(plane)
    @planes << plane
  end
end
