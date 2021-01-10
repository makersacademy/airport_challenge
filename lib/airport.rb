require_relative "plane"
require_relative "weather"

class Airport

  STANDARD_CAPACITY = 10

  attr_reader :planes, :capacity

  def initialize(weather, capacity = STANDARD_CAPACITY)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    fail "Already landed" if plane.docked

    fail "Can't land while stormy" if is_stormy

    fail "Airport is full" if is_full

    plane.docked = true
    @planes.push(plane)
  end

  def take_off
    fail "There are no planes to take off" if is_empty

    fail "Can't take off while stormy" if is_stormy

    plane = @planes.pop
    plane.docked = false
    return plane
  end

  private

  def is_empty
    @planes.empty?
  end

  def is_full
    @planes.count >= @capacity
  end

  def is_stormy
    @weather.forecast == "stormy"
  end
end
