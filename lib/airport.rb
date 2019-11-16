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

  def take_off
  end

  def takeoff?
    true
  end

  def weather
    @weather = rand(1..10)
    "sunny" if @weather >= 3
    "stormy" if @weather <= 3
  end

end