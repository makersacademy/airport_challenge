class Airport 
  attr_accessor :planes, :capacity

  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def weather(weather)
    @weather = weather
  end

  def land(plane)
    fail "Airport at full capacity" if full?
    @planes << plane
  end

  def depart
    fail "Stormy weather alert" if stormy?
    @planes.pop
  end

  def full? 
    @planes.count >= @capacity
  end

  def stormy?(weather)
    weather.forecast == :stormy
  end

end 
