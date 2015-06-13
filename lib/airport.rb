class Airport

  DEFAULT_CAPACITY = 10

  attr_accessor :capacity

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def take_off(plane)
    @planes.pop
  end

  def land_plane(plane)
    fail "Airport is full" if @planes.count >= @capacity
    @planes << plane
  end
end
