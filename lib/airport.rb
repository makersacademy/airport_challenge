class Airport

  attr_reader :planes

  def land(plane)
    @planes = plane
  end

  def take_off(plane)
    raise "Can't take off due to stormy weather!" if stormy?
    @planes = nil
  end

  def stormy?
    
    weather.currently == :stormy
  end
end
