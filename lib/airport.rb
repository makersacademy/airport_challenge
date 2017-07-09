class Airport

  attr_accessor :planes, :weather, :capacity

  def initialize(weather = "sunny")
    @planes = []
    @weather = weather
    @capacity = 10
  end

  def land(plane)
    planes << plane
  end

  def in_airport?(plane)
    planes.include? plane
  end

  def full?
    planes.length <= 19 ? false : true
  end

  def takeoff(plane)
    weather == "stormy" ? "cannot takeoff due to weather" : planes.delete(plane)
  end

end
