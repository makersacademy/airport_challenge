class Airport

  def initialize
    @planes = []
  end

  def land(plane)
    fail "Airport is full!" if full?
    @planes << plane
    @plane = plane
  end

  def take_off
    fail "no planes available for take-off!" unless @plane
    @plane
  end

  private

  def full?
    @planes.count >= 10
  end

end
