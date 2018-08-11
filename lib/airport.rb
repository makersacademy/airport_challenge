class Airport
  attr_reader :plane
  def land(plane)
    @plane = plane
  end
  def takeoff(plane)
    pl = @plane
    @plane = nil
    pl
  end
end
