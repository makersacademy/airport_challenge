require_relative 'plane'
require_relative 'weather'

class Airport

  attr_accessor :all_planes, :capacity, :weather

  DEFAULT_CAPACITY = 35

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @all_planes = []
    @weather = weather
  end

  def can_land(flight)
    fail "cannot land at the moment due to stormy weather" if weather.stormy?
    @all_planes.push(flight)
  end

  def can_take_off(flight)
    !weather.stormy?
    @all_planes.delete(flight)
  end

  private

  def airport_full?
    capacity <= all_planes.length
    fail "airport is full now, cannot land any planes" if airport_full?
  end

  def stormy?
    weather.stormy?
  end
end