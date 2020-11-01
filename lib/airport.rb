require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 50
  attr_reader :capacity, :planes

  def initialize(capacity = DEFAULT_CAPACITY, planes = [])
    @capacity = capacity
    @planes = planes
    @weather = Weather.new
  end

  def current_weather
    @weather.current_weather
  end
end