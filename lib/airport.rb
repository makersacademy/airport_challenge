require_relative "plane"

class Airport
  attr_reader :capacity, :good_weather
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    check_weather
    fail "Airport is full" if planes.length == capacity
    fail "Plane has already landed" if plane.has_landed
    fail "Poor weather prevents landing" unless good_weather
    plane.landed(true)
    planes << plane
  end

  def takeoff(plane)
    check_weather
    fail "Only planes in an airport can take off from it" unless in_airport?(plane)
    fail "Poor weather prevents takeoff" unless good_weather
    plane.landed(false)
    planes.delete(plane)
  end

  def in_airport?(plane)
    planes.include?(plane)
  end

  def change_capacity(num)
    @capacity = num
  end

private
  attr_reader :planes

  def check_weather
    @good_weather = (rand(20) > 0)
  end

end
