class Airport
  attr_reader :planes
  attr_accessor :capacity

  def initialize(capacity = 10)
    @planes = []
    @capacity = capacity
  end

  # Instructs plane to land at airport
  def land(plane)
    @planes << plane
  end

  # Instructs plane to takeoff from airport
  def takeoff(plane)
    @planes.pop
  end

  # Prevents planes from landing if the airport is full
  def prevent_landing
    raise "Unable to land, airport is full" if full?
  end

  def full?
    return true if @planes.length >= @capacity
  end
end
