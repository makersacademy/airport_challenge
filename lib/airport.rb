class Airport
  attr_reader :capacity, :planes_hub
  CAPACITY = 50

  def initialize(capacity = CAPACITY)
    @capacity = capacity
    @planes_hub = []
  end

  def land(plane)
    fail "this airport is full" if full?
    @planes_hub << plane
  end

  def takeoff(plane)
    @planes_hub.delete(plane)
  end

  private

  def full?
    @planes_hub.count >= capacity
  end
end
