class Airport
  attr_reader :planes, :capacity
  CAPACITY = 10

  def initialize
    @planes = []
    @capacity = CAPACITY
  end

  def land(plane)
    fail "Airport is full" if full?
    @planes << plane
  end

  def takeoff
    @planes.pop
  end

  private

  def full?
    @planes.count >= CAPACITY
  end

end
