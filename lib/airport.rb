require 'weather'

class Airport

  AIRPORT_FULL_ERROR = 'Unable to land: airport full'
  STORMY_WEATHER_ERROR = 'Unable to land: stormy weather'
  PLANE_UNAVAILABLE_ERROR = 'Unable to takeoff: plane unavailable'

  def initialize(capacity = 20, weather_generator = Weather.new)
    @capacity = capacity
    @planes = []
    @weather_generator = weather_generator
  end

  def full?
    @planes.length >= @capacity
  end

  def land(plane)
    raise AIRPORT_FULL_ERROR if full?
    raise STORMY_WEATHER_ERROR unless weather_safe?

    plane.land
    @planes.push(plane)
  end

  def takeoff(plane)
    raise PLANE_UNAVAILABLE_ERROR unless @planes.include?(plane)
    raise STORMY_WEATHER_ERROR unless weather_safe?

    @planes.delete(plane)
  end

  def weather_safe?
    true unless stormy?
  end

  private

  def stormy?
    weather == :stormy
  end

  def weather
    @weather_generator.weather
  end

end
