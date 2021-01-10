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
    fail "Can't land while stormy" if stormy?

    for plane in planes
      fail "Airport is full" if full?

      fail "Already landed" if plane.docked

      plane.docked = true
      @planes.push(plane)
    end
  end

  def take_off(plane_count = 1)
    fail "Departure plane count must be greater than zero" if plane_count <= 0

    fail "Can't take off while stormy" if stormy?

    departed_planes = []

    plane_count.times { departed_planes.push(depart_plane) }

    return departed_planes.length > 1 ? departed_planes : departed_planes[0]
  end

  private

  def empty?
    @planes.empty?
  end

  def full?
    @planes.count >= @capacity
  end

  def stormy?
    @weather.forecast == "stormy"
  end

  def depart_plane
    fail "There are no planes to take off" if empty?

    plane = @planes.pop
    plane.docked = false
    return plane
  end
end
