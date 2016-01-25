
require_relative "plane"
require_relative "weather"


class Airport

DEFAULT_CAPACITY = 4

  attr_reader :planes, :weather, :capacity

  def initialize( capacity = DEFAULT_CAPACITY , weather = Weather.new)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land plane
    fail "Storm!Landing is not allowed!" if weather.stormy?
    fail "Landing is not allowed! Airport is full!" if full?
    fail "This plane is already in the airport!" if plane.landed
    plane.land
    planes << plane
    "#{plane} has landed"
  end

  def takeoff plane
    fail "Storm!Takeoff is not allowed!" if weather.stormy?
    fail "This plane is not in the airport!" unless planes.include?(plane)
    fail "This plane is already in the air!" if plane.flying
    plane.fly
    planes.delete(plane)
    "#{plane} has taken off"
  end

  def full?
    planes.count >= capacity
  end

end