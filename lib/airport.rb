class Airport

  attr_reader :planes

  def land(plane)
    @planes = plane
  end

  def takeoff(plane)
    @planes = nil
  end

end
