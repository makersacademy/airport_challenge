require './lib/weather'
require './lib/plane'

class Airport

  attr_reader :hangar, :capacity, :weather

  def initialize(capacity: 1, weather: Weather.new)
    @hangar = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    fail "Cannot land due to stormy weather" if weather.stormy?
    fail "No space available" if full?

    @hangar << plane
  end

  def take_off(*)
    fail "Cannot take off due to stormy weather" if weather.stormy?

    @hangar.pop
  end

  def full?
    @hangar.length >= capacity
  end

end
