class Airport
  attr_reader :max_capacity, :planes
  attr_accessor :weather

  def initialize weather = "sunny", max_capacity = 10
    @weather = weather
    @max_capacity = max_capacity
    @planes = []
  end

  def safe?
    return false if @weather.downcase == "stormy"

    return true
  end

  def space?
    @planes.size < @max_capacity
  end

  def takeoff(plane)
    fail "Weather is unsafe" unless safe?
    fail "Plane is not in this airport" unless @planes.include?(plane)

    planes.delete(plane)
    return true
  end

  def land(plane)
    fail "Airport at capacity" unless space?
    fail "Weather is unsafe" unless safe?

    @planes << plane
  end
end
