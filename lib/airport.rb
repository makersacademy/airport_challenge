require_relative "plane.rb"

class Airport

  DEFAULT_CAPACITY = 100

  attr_accessor :capacity
  attr_reader :airport_id, :planes_on_ground

  def initialize (capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes_on_ground = []
    @airport_id = self.object_id
  end

  def land (plane)
    check_for_landing_issues (plane)
    plane.flying = false
    plane.set_location (airport_id)
    planes_on_ground << plane
  end

  def takeoff (plane)
    check_for_takeoff_issues (plane)
    plane.flying = true
    planes_on_ground.delete(plane)
  end

  def weather
    # Approximately 1 times in 6, the weather will be stormy
    rand(5) == 0? "stormy" : "sunny"
  end

private

def full?
  planes_on_ground.count == capacity
end

  def check_for_landing_issues (plane)
    fail "Cannot land. Airport is full." if full?
    fail "Cannot land. Plane isn't flying." if !plane.flying?
    fail "Cannot land due to storm." if weather == "stormy"
  end

  # Credit to Jen H for the planes_on_ground.include?(plane) == false idea
  def check_for_takeoff_issues (plane)
    fail "Cannot take off. Plane is flying." if plane.flying?
    fail "Cannot take off due to storm." if weather == "stormy"
    fail "Can't take off as plane is not in the airport." if planes_on_ground.include?(plane) == false
  end

end
