require_relative 'plane'
require_relative 'weather'

class Airport
  attr_accessor :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
    @weather = Weather.generate
  end

  def request_landing(plane)
    fail "Plane is already in hangar" if in_hangar?(plane)

    check_capacity
    check_weather
    @hangar << plane
  end

  def request_take_off(plane)
    fail "Plane is not currently in hangar" unless in_hangar?(plane)

    check_weather
    @hangar.delete(plane)
    confirm_take_off(plane)
  end

  def in_hangar?(plane)
    @hangar.include?(plane)
  end

  private

  def check_capacity
    fail "Airport is at maximum capacity" if max_capacity?
  end

  def max_capacity?
    @hangar.count >= capacity
  end

  def check_weather
    fail "Weather conditions are too unsafe" if weather_stormy?
  end

  def weather_stormy?
    @weather == 'stormy'
  end

  def confirm_take_off(plane)
    puts "[plane has taken off from airport]" unless in_hangar?(plane)
  end
end
