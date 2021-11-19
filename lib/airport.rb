class Airport

  attr_reader :plane

  def land(plane)
    @plane = plane
  end

  def takeoff
    @plane = nil
  end
end
