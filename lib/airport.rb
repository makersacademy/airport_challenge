#require_relative "plane.rb"

class Airport
  attr_reader :max_capacity, :planes
  attr_accessor :weather

  def initialize weather = "sunny", max_capacity=10
    @weather = weather
    @max_capacity = max_capacity
    @planes = []
  end

  def safe?
    if @weather == "stormy"
      return false
    else
      return true
    end
  end

  def space?
    !(@planes.size >= @max_capacity)
  end

  def takeoff(plane)
    fail "Weather is unsafe" if not safe?
    fail "Plane is not in this airport" if not @planes.include?(plane)
    planes.delete(plane)
    return true
  end

  def land(plane)
    fail "Airport at capacity" if not self.space?
    fail "Weather is unsafe" if not safe?
    @planes << plane
  end

end