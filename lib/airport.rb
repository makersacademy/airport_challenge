class Airport
  attr_reader :capacity, :planes_hub

  def initialize(capacity = 50)
    @capacity = capacity
    @planes_hub = []
  end

  def land(plane)
    fail "this airport is full" if @planes_hub.count >= capacity
    @planes_hub << plane
  end

  def takeoff(plane)
    @planes_hub.pop
  end
end
