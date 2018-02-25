require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :weather
  def initialize(weather: Weather.new)
    @hangar = []
    @weather = weather
  end

  def land(plane)
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
end
