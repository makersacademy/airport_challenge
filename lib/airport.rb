require './lib/weather.rb'

class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :hangar

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @weather = weather
    @hangar = []
  end

  def land(plane)
    raise "Weather conditions are preventing landing" if weather_check
    raise "Airport already full" if full?
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

  def full?
    @hangar.length >= DEFAULT_CAPACITY
  end
end
