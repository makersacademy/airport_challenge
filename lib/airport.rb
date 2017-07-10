class Airport

  DEFAULT_CAPACITY = 10

  attr_accessor :planes, :weather, :capacity

  def initialize(weather = "sunny", capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    planes << plane
  end

  def in_airport?(plane)
    planes.include? plane
  end

  def full?
    planes.length <= 9 ? false : true
  end

  def takeoff(plane)
    fail "cannot takeoff due to weather" if weather == "stormy"
    fail "cannot takeoff if plane is not in airport" if in_airport?(plane) == false
    planes.delete(plane)
  end

end
