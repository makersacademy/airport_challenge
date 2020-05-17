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

  def request_landing(plane)
    fail "Airport is at maximum capacity" if max_capacity?
    fail "Weather conditions are too unsafe for landing" if weather_stormy?

    @hangar << plane
  end

  def request_take_off(plane)
    fail "Weather conditions are too unsafe for take off" if weather_stormy?

    @hangar.delete(plane)
    confirm_take_off(plane)
  end

  def in_hangar?(plane)
    @hangar.include?(plane)
  end

  private

  def confirm_take_off(plane)
    puts "[plane has taken off from airport]" unless in_hangar?(plane)
  end

  def max_capacity?
    @hangar.count == capacity
  end

  def weather_stormy?
    @weather.generate == 'stormy'
  end
end
