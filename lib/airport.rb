require 'plane'
require 'weather'

class Airport
  attr_reader :capacity
  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY, weather)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def take_off(plane)
    fail 'Plane not in this airport' unless parked?(plane)

    fail 'Cannot take off in stormy weather' if bad_weather?

    @planes.delete(plane)
    plane.taken_off
  end

  def land(plane)
    fail "Airport full" if full?

    fail "Plane already landed" if parked?(plane)

    fail "Cannot land in stormy weather" if bad_weather?

    @planes << plane
    plane.landed 
  end

  private

  def parked?(plane)
    @planes.include? plane
  end

  def full?
    @planes.size >= @capacity
  end

  def bad_weather?
    @weather.weather_condition == :stormy
  end
end
