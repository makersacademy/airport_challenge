require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes
  def initialize(weather: Weather.new)
    @planes = []
    @weather = weather
  end

  def land(plane)
    fail "Unable to land due to weather" if weather.stormy?
    @planes << plane
  end

  def take_off
    fail "Unable to take off due to weather" if weather.stormy?
    planes.pop
  end

  private
  attr_reader :weather
end
