require './lib/weather.rb'

class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :hangar, :capacity

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @weather = weather
    @hangar = []
  end

  def land(plane)
    raise "Stormy weather conditions are preventing landing" if weather_check
    raise "Airport already full" if full?
    hangar << plane
  end

  def take_off(plane)
    raise "Stormy weather conditions are preventing take off" if weather_check
    hangar.pop
    "#{plane} has taken off"
  end

  private

  def weather_check
    @weather.stormy?
  end

  def full?
    hangar.length >= capacity
  end
end
