require './lib/weather.rb'

class Airport

  attr_reader :hangar

  def initialize(weather = Weather.new)
    @weather = weather
    @hangar = []
  end

  def land(plane)
    @hangar << plane
  end

  def take_off
    raise "Weather conditions are preventing take off" if weather_check
    plane = @hangar[-1]
    @hangar.pop
    "#{plane} has taken off"
  end

  def weather_check
    @weather.stormy?
  end

end
