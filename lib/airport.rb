class Airport

  MAX_CAPACITY = 6

  def initialize
    @planes = []
  end

  def accept_plane plane
    fail "Airport is full" if @planes.length == MAX_CAPACITY
    @planes << plane
  end

end
