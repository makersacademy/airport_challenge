require_relative 'airplane'
require_relative 'weather'

class Airport

  attr_reader :planes

  DEFAULT_CAPACITY = 20

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @weather = weather
    @airport = []
    @capactiy = capacity
  end

  def land(plane)
    raise "no planes can land" unless @weather.weather_condition == false
    @airport << plane
  end

  def takeoff
    raise "No planes can take off, stormy weather." unless @weather.weather_condition == false
    @airport.pop
  end

end
