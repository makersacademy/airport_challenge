require_relative "plane"

class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end
  def land(plane)
    fail "Landing is prevented due to stormy conditions" if weather == "stormy"
    fail "The airport is full" if full?
    @planes << plane
  end

  def takeoff
    fail "Takeoff is prevented due to stormy conditions" if weather == "stormy"
    plane = @planes.pop
    @planes.delete_if { |aeroplane| aeroplane == plane}
    "The plane has taken off"
  end

  def full? 
    @planes.count >= @capacity
  end
  
  def weather
    conditions = ["clear", "rain", "snow", "wind", "fog", "stormy"]
    conditions[rand(6)]
  end
end