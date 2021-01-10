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

  def land(*planes)
    fail "Can't land while stormy" if is_stormy

    for plane in planes
      fail "Airport is full" if is_full

      fail "Already landed" if plane.docked

      plane.docked = true
      @planes.push(plane)
    end
  end

  def take_off(plane_count = 1)
    fail "Can't take off while stormy" if is_stormy

    i = 0

    departed_planes = []

    while i < plane_count 
      fail "There are no planes to take off" if is_empty

      i += 1

      plane = @planes.pop
      plane.docked = false
      departed_planes.push(plane)
    end

    return departed_planes.length > 1 ? departed_planes : departed_planes[0]
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
