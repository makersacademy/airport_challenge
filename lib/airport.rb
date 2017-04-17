require './lib/plane'
require './lib/weather'

class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :hangar, :capacity, :plane, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane = Plane.new)
    fail 'Unable to land at airport' if weather_unsafe? || hangar_full?
    @hangar << plane
    plane.landing_confirmation
  end

  def takeoff(plane = Plane.new)
    fail 'Unable to takeoff from airport' if weather_unsafe? || hangar_empty?
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
