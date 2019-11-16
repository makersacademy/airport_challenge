class Airport 
  attr_reader :planes

  def initialize
    @planes = []
    @capacity = 30
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

end