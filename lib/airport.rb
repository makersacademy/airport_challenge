require_relative 'weather'

class Airport
  attr_reader :capacity, :planes

  def initialize(capacity = 50, planes = [])
    @capacity = capacity
    @planes = planes
    @weather = Weather.new
  end

  def current_weather
    @weather.current_weather
  end
end