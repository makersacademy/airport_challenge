require_relative 'plane'
require_relative 'weather'


class Airport

attr_reader :planes, :weather, :capacity
DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    fail "Storm" if stormy?
    fail "Full" if full?
    fail "Error: that plane has already landed" if plane.landed?
    planes << plane
    plane.location = :airport
  end

  def clear_for_take_off(plane)
    fail "Error: that plane isn't at this airport" unless planes.include? plane
    fail "Storm" if stormy?
    planes.delete(plane)
    plane.location = :air
  end

  private
  
  def full?
    planes.count >= capacity
  end

  def stormy?
    weather.todays_weather == :stormy
  end
end
