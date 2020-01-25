require_relative 'plane'
require_relative 'weather'
class Airport

  def initialize(capacity = 1, weather = Weather.new)
    @capacity = capacity
    @parked_planes = []
    @weather = weather
  end

  def tell_to_land(plane)
    fail "Can't land; airport's full." if @parked_planes.size >= @capacity
    fail "Can't land; stormy weather." if @weather.stormy?

    @parked_planes << plane
  end

  def tell_to_takeoff(_plane)
    fail "Can't take off; stormy weather." if @weather.stormy?

    @parked_planes.pop
    @parked_planes.count
  end
end
