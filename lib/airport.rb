require_relative "plane.rb"

class Airport

  DEFAULT_CAPACITY = 10

  attr_accessor :capacity, :planes_on_ground

  def initialize (capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes_on_ground = []
  end

  def land (plane)
    fail "Cannot land. Airport is full." if full?
    fail "Cannot land. Plane isn't flying." if !plane.flying?
    fail "Cannot land due to storm." if weather == "stormy"
    plane.flying = false
    @planes_on_ground << plane
  end

  def takeoff (plane)
    fail "Cannot take off. Plane is flying." if plane.flying?
    plane.flying = true
    @planes_on_ground.pop
    plane
  end

  def full?
    planes_on_ground.count == capacity
  end

  def weather
    "sunny"
    # rand(9) == 0? "stormy" : "sunny"
  end

end
