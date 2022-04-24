require_relative "plane"

class Airport

  PLANE_CAPACITY = 5
  def initialize(capacity = PLANE_CAPACITY)
    @landed_planes = []
    @capacity = capacity
    @weather = ""
  end

  attr_reader :landed_planes
  attr_reader :capacity
  attr_accessor :weather

  def land(plane)
    fail "Max capacity for planes in Airport has been reached." if full?
    fail "Plane already landed in Airport." if already_landed?(plane)
    landed_planes << plane
  end

  def take_off(plane)
    fail "Cannot take off - Weather is stormy." if weather == "stormy"
    landed_planes.delete(plane)
  end

  private
  
  def already_landed?(plane)
    landed_planes.include?(plane)
  end

  def full?
    landed_planes.count >= capacity
  end
end
