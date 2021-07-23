require_relative "plane"

class Airport
  
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport is full" if full?

    fail "Cannot land in stormy weather" if stormy?

    @planes << plane
  end

  def takeoff(plane)
    fail "Cannot takeoff in stormy weather" if stormy?

    @planes.delete(plane)
    @planes
  end

  private

  attr_reader :planes

  def full?
    @planes.count >= @capacity
  end

  def stormy?
    weather = rand(1..10)
    weather >= 9
  end

end
