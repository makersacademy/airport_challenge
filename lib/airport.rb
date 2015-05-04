class Airport

  MAX_CAPACITY = 6

  def initialize
    @planes = []
  end

  def accept_plane plane
    fail "Airport is full" if @planes.length == MAX_CAPACITY
    fail "Stormy weather" if stormy?
    @planes << plane
  end

  def launch_plane plane
    fail "Stormy weather" if stormy?
    @plane = plane
    @plane
  end

  def stormy?
  end

end
