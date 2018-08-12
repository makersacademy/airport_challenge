require_relative "weather"
class Airport
  DEFAULT_CAPACITY = 5
  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane, weather = Weather.new)
    fail "This airport is full" if full?
    fail "Stormy weather, can't land" if weather.stormy?
    @planes << plane
    @planes.last
  end

  def takeoff(plane, weather = Weather.new)
    fail "Stormy weather, can't take off" if weather.stormy?
    @planes.delete_at(@planes.index(plane))
  end

  private
  def full?
    @planes.count == @capacity
  end
end
