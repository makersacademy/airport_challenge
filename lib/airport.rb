class Airport

  def initialize
    @plane = []
  end

  def land(plane)
    @plane << plane
  end

  def take_off
    @plane.pop
  end

end
