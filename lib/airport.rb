class Airport
  attr_accessor :planes, :capacity

  def initialize(capacity = 50)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    @planes.pop
    @planes
  end

  def confirm_takeoff(plane)
    p @planes.include?(plane)
  end
end

# airport = Airport.new
# airport.take_off("plane")
