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
    @planes_on_ground << plane
  end

  def takeoff (plane)
    fail "Cannot take off. Plane is flying." if plane.flying?
    plane
  end

  def full?
    planes_on_ground.count == capacity
  end

end
