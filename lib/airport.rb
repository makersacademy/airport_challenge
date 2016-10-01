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
    plane.in_airport = true
    @planes_on_ground << plane
  end

  def takeoff (plane)
    fail "Cannot take off. Plane is flying." if plane.flying?
    fail "Cannot take off due to storm." if weather == "stormy"
    fail "Can't take off as plane is not in the airport." if !plane.in_airport?
    plane.flying = true
    plane.in_airport = false
    @planes_on_ground.delete(plane)
    plane
  end

  def weather
    # Approximately 1 times in 6, the weather will be stormy
    rand(5) == 0? "stormy" : "sunny"
  end

private

  def full?
    planes_on_ground.count == capacity
  end

end
