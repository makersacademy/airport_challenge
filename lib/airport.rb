require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes, :capacity, :weather
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def take_off(plane)
    fail "Too stormy to take off today." if @weather.stormy?
    @planes.pop
  end

  def land(plane)
    fail "Too stormy to landing today." if @weather.stormy?
    fail "Airport full!" if full?
    @planes << plane
  end

  private
  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

end
