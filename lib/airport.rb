class Airport

  attr_reader :plane

  def land(plane)
    @plane = plane
  end

  def take_off
    return "Plane has left the airport" unless @plane.nil?
  end

end
