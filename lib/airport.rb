class Airport
  # Understands how to control planes in the airport
  attr_reader :capacity, :planes_on_the_ground
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes_on_the_ground = []
  end

  def land(plane)
    plane.airborne = false
    @planes_on_the_ground << plane
  end

  def takeoff
    plane = @planes_on_the_ground.pop
    plane.airborne = true
    plane
  end

  def full?
    @planes_on_the_ground.count >= capacity
  end

  def empty?
    @planes_on_the_ground.count.zero?
  end

end
