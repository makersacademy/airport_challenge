
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
    planes << plane
    "#{plane} has landed"
  end

  def takeoff plane
    fail "Storm!Takeoff is not allowed!" if weather.stormy?
    planes.delete(plane)
    "#{plane} has taken off"
  end

  def full?
    planes.count >= capacity
  end

end