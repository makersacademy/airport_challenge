require_relative "../lib/weather.rb"

class Airport
  attr_accessor :planes
  DEFAULT_CAPACITY = 20

  def initialize
    @planes = []
  end

  def land(plane)
    current_weather = Weather.new
    fail "Due to stormy weather, no planes will be landing today" if current_weather.forecast == 'stormy'
    @planes << plane
    @planes.last
  end

  def take_off
    current_weather = Weather.new
    fail "Due to stormy weather, no planes will be taking off today" if current_weather.forecast == 'stormy'
    @planes.pop
  end
end
