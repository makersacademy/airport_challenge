class Airport

  def initialize
    @planes = []
  end

  def land(plane)
    fail "Airport is full!" if @planes.count >= 10
    @planes << plane
    @plane = plane
  end

  def take_off
    fail "no planes available for take-off!" unless @plane
    @plane
  end

end
