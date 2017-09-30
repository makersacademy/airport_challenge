class Airport

  attr_reader :plane

  def land(plane)
    @plane = plane
  end

  def take_off
    @plane
  end

end
