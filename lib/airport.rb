class Airport

  def initialize
    @planes = []
  end

  def planes
    @planes
  end

  def land(plane)
    plane.land!
    planes.push(plane)
  end

  def take_off(plane)
    plane.take_off!
    @planes.delete(plane)
  end

  def check_weather
    weather = ["sunny", "sunny", "sunny", "stormy"]
    weather.sample
  end



end
