require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :weather, :capacity
  DEFAULT_CAPACITY = 30

  def initialize(capacity = DEFAULT_CAPACITY, weather: Weather.new)
    @hangar = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport is full, can\'t land' if full
    fail 'Bad weather, landing cancelled' if weather.stormy?
    @hangar << plane
  end

  def takeoff(plane)
    fail 'Bad weather, takeoff cancelled' if weather.stormy?
    @hangar.delete(plane)
  end

  def status
    "There are #{@hangar.count} planes here"
  end

private
  def empty
    @hangar.count.zero?
  end

  def full
    @hangar.count >= capacity
  end
end
