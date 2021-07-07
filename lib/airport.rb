class Airport 
  attr_reader :planes
  attr_reader :weather
  DEFAULT_CAPACITY = 50

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    fail "The airport is full" if @planes.count >= @capacity
    fail "Cannot land because of the storm" if @weather == "stormy"
    @planes << plane
  end

  def take_off(plane)
    fail "Cannot take off because of the storm" if @weather == "stormy"
    @planes.pop
    @planes
  end

  def takeoff?
    true
  end

  def weather
    weather_report = rand(1..10)
    @weather == "stormy" if weather_report <= 3
  end

end