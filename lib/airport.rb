class Airport

  def initialize(capacity)
    @capacity = capacity
    @hanger = []
  end

  def land_plane(plane)
    fail "Airport is full" if @hanger.count >= @capacity
    @hanger << plane
  end

  def take_off(plane)
  end

end
