require_relative 'plane'
require_relative 'stormy_weather'

class Airport
  DEFAULT_CAPACITY = 20

  attr_reader :planes, :stormy
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY, planes = [])
    @planes = planes
    @capacity = capacity
    @stormy = StormyWeather.new
  end

  def land(plane)
    fail "Airport is full" if full?
    fail "Cannot land, due to stormy weather" if stormy
    planes.push(plane)
  end

  def take_off
    fail "Cannot take off, due to stormy weather" if stormy
    fail "There are no planes left to takeoff" if empty?
    "#{planes.pop} has taken off."
  end

  private

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end

end
