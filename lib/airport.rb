class Airport

  def initialize(capacity)
    @capacity = capacity
    @hanger = []
  end

  def land_plane(plane)
    fail "Airport is full" if full?
    fail "Cannot land: weather is stormy" if stormy?
    @hanger << plane
  end

  def take_off(plane)
  end

  private

  def full?
    @hanger.count >= @capacity
  end

  def stormy?
    rand(1..4) > 3
  end 

end
