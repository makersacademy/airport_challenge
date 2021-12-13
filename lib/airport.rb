class Airport
  DEFAULT_CAPACITY = 20

  def initialize
    @plane = []
  end

  def land(plane)
    fail 'Airport is full - plane cannot land' if @plane.count >= 20
    @plane << plane
  end

  def takeoff

  end

  def full?
    plane.count >= DEFAULT_CAPACITY
  end

  def weather
    rand(1..6)
end
