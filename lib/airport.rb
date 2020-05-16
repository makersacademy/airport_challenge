require_relative 'plane'
require_relative 'weather'

class Airport
  attr_accessor :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
    @weather = Weather.new
  end

  def approve_landing(plane)
    fail "Airport is at maximum capacity" if max_capacity?

    check_weather
    @hangar << plane
  end

  def approve_take_off(plane)
    fail "Airport is at maximum capacity" if max_capacity?

    check_weather
    @hangar.delete(plane)
  end

  def in_hangar?(plane)
    @hangar.include?(plane)
  end

  private

  def check_weather
    fail "Weather conditions are unsafe" if @weather.stormy?
  end

  def max_capacity?
    @hangar.count == capacity
  end
end
