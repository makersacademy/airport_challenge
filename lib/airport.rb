class Airport

  attr_accessor :planes, :weather

  def initialize(weather = "sunny")
    @planes = []
    @weather = weather
  end

  def land(plane)
    planes << plane
  end

  def in_airport?(plane)
    planes.include? plane
  end

  def takeoff(plane)
    weather == "stormy" ? "cannot takeoff due to weather" : planes.delete(plane)
  end

end
