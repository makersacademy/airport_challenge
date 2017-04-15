class Airport

  attr_reader :plane, :runways

  def take_off
    return @runways.pop unless @runways.nil?
    "No airplanes landed."
  end

  def land(plane)
    @plane = plane
    @runways = []
    @runways << plane
  end

  def landed?(plane)
    return true if @runways.include? plane
    false
  end

end
