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
    fail "The plane has already landed" unless can_land?(plane)
    @planes << plane
    plane.land
  end

  def takeoff(plane)
    fail "Takeoff is prevented due to stormy conditions" if weather == "stormy"
    fail "The plane is not landed at this airport" unless can_takeoff?(plane)
    plane = @planes.pop
    @planes.delete_if { |aeroplane| aeroplane == plane}
    plane.takeoff
  end
  
  private
  def weather
    conditions = ["clear", "rain", "snow", "wind", "fog", "stormy"]
    conditions[rand(6)]
  end

  def full? 
    @planes.count >= @capacity
  end

  def can_land?(plane)
    plane.state == :flying
  end

  def can_takeoff?(plane)
    plane.state == :landed && @planes.find { |aeroplane| aeroplane == plane} == plane
  end
end