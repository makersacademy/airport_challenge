class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane, weather)
    check_weather(weather)
    raise 'Airport full.' if airport_full?
    plane.land
    @planes.push(plane)
  end

  def takeoff(plane)
    @planes.delete(plane)
  end
end
