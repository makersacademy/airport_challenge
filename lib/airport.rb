class Airport
  DEFAULT_CAPACITY = 1
  attr_reader :planes
  attr_accessor :weather

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = "sunny"

  end

  def land_plane(plane)
    fail "Airport full!" if self.full?
    fail "Plane is not airborne!" if plane.airborne == false
    @planes << plane
    plane.airborne = false

  end

  def take_off_plane(plane)
    fail "Plane not at airport!" if !@planes.include?(plane)
    @planes.delete(plane)
    plane.airborne = true
  end

  def full?
    @planes.length == @capacity ? true : false
  end

end
