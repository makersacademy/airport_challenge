require_relative '../lib/plane.rb'
require_relative '../lib/weather.rb'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY, planes = [])
      @capacity = capacity
      @planes = planes
  end

  def land(plane = Plane.new)
    raise RuntimeError, plane.airport_max_capacity  if full?
    fail plane.stormy_weather if weather_unsafe?
    planes << plane
    plane.land_plane_confirmation
  end

  def takeoff(plane = Plane.new)
     fail plane.stormy_weather if weather_unsafe?
     planes.pop
     plane.takeoff_plane_cofirmation
  end

  private

  def full?
    @planes.count >= @capacity
  end

  def weather_unsafe?(weather = Weather.new)
    weather.stormy?
  end

end
