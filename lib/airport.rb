class Airport 
  attr_reader :planes
  DEFAULT_CAPACITY = 50

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    fail "The airport is full" if @planes.count >= @capacity
    @planes << plane
  end

  def take_off
  end

  def takeoff?
    true
  end

  def weather
    
  end

end