require './lib/plane'
require './lib/weather'

class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :hangar, :capacity, :plane, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    fail plane.landing_problem if weather_unsafe?
    fail plane.landing_problem if hangar_full?
    @hangar << plane
    plane.landing_confirmation
  end

  def takeoff(plane = Plane.new)
    fail plane.takeoff_problem if weather_unsafe?
    fail plane.takeoff_problem if hangar_empty?
    @hangar.pop
    plane.takeoff_confirmation
  end

  # private

  def hangar_full?
    @hangar.count >= capacity
  end

  def hangar_empty?
    @hangar.empty?
  end

  def weather_unsafe?(weather = Weather.new)
    weather.stormy?
  end

end
