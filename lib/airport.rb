require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 1

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @airport = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport full' if full?
    fail "Flight cannot land due to stormy weather" if bad_weather?
    airport << plane
  end

  def take_off(*)
    fail "Flight cancelled due to bad weather" if bad_weather?
    @airport.pop
  end

  def bad_weather?
    weather.stormy?
  end

  def weather
    @weather ||= Weather.new
  end

  private

  attr_reader :airport

  def full?
    airport.count >= capacity
  end
end
