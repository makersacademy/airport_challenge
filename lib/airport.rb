class Airport

  attr_reader :plane, :planes

  def take_off
    return @planes.pop if !@planes.nil?
    "No airplanes landed."
  end

  def land(plane)
    @plane = plane
    @planes = []
    @planes << plane
  end

end
