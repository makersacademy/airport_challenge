class Airport
  attr_accessor :planes, :capacity

  def initialize(capacity = 50)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    full? ? (raise "Airport is full!") : @planes << plane
  end

  def take_off(plane)
    @planes.pop
    @planes
  end

  def confirm_takeoff(plane)
    @planes.include?(plane)
  end

  private

  def full?
    @planes.size >= @capacity
  end
end

# airport = Airport.new
# airport.take_off("plane")
