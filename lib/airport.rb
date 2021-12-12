class Airport

  def initialize
    @plane = []
  end

  def land(plane)
    fail 'Airport is full - plane cannot land' if @plane.count >= 20
    @plane << plane
  end

  def takeoff

  end
end
