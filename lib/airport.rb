require_relative "plane"
require_relative "weather"

class Airport

  attr_reader :planes

  def initialize(weather = Weather.new)
    @planes = []
    @weather = weather
  end

  def land(plane)
    fail "Landing prevented due to stormy weather" if @weather.stormy?
    planes << plane
    planes.last
  end

  def take_off(plane)
    fail "Take-off prevented due to stormy weather" if @weather.stormy?
    planes.delete plane
  end

end
