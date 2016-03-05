require_relative "plane"
require_relative "weather"

class Airport

  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 50

  def initialize(weather = Weather.new)
    @weather = weather
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    fail "Landing prevented due to stormy weather" if @weather.stormy?
    fail "Airport reached its capacity" if @planes.size >= DEFAULT_CAPACITY
    planes << plane
    planes.last
  end

  def take_off(plane)
    fail "Take-off prevented due to stormy weather" if @weather.stormy?
    planes.delete plane
  end

end
