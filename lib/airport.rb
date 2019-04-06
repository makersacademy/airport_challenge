class Airport

  def initialize(capacity)
    @capacity = capacity
    @hanger = []
  end

  def land_plane(plane)
    fail "Airport is full" if full?
    @hanger << plane
  end

  def take_off(plane)
  end

  private

  def full?
    @hanger.count >= @capacity
  end

end
