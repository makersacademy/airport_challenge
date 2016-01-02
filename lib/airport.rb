require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :plane, :status, :weather, :planes, :capacity

  CAPACITY = 20

  def initialize(capacity = CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def landing(plane, weather)
    @weather = weather
    fail "Cannot land due to storm" if @weather.condition == true
    fail "Landing denied airport full" if full?
    @plane = plane
    @plane.status("landed")
    @planes << plane
  end

  def take_off(plane, weather)
    @weather = weather
    fail "Cannot take off due to storm" if @weather.condition == true
    @plane = plane
    @plane.status("on air")
    @planes.delete(plane)
  end

  private
  def full?
    planes.length >= @capacity
  end

end
