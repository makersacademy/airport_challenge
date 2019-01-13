require_relative 'weather'

class Airport

  AIRPORT_FULL_ERROR = 'Unable to land: airport full'
  STORMY_WEATHER_ERROR = 'Unable to land: stormy weather'
  PLANE_UNAVAILABLE_ERROR = 'Unable to takeoff: plane unavailable'
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY, weather_generator = Weather.new)
    @capacity = capacity
    @planes = []
    @weather_generator = weather_generator
  end

  def full?
    check_capacity
  end

  def land(plane)
    raise AIRPORT_FULL_ERROR if full?
    raise STORMY_WEATHER_ERROR unless weather_safe?

    plane.land
    park_plane(plane)
  end

  def takeoff(plane)
    raise PLANE_UNAVAILABLE_ERROR unless @planes.include?(plane)
    raise STORMY_WEATHER_ERROR unless weather_safe?

    plane.takeoff
    remove_plane(plane)
  end

  def weather_safe?
    check_weather
  end

  private

  def check_weather
    true unless stormy?
  end

  def stormy?
    weather == :stormy
  end

  def weather
    @weather_generator.weather
  end

  def park_plane(plane)
    @planes.push(plane)
  end

  def remove_plane(plane)
    @planes.delete(plane)
  end

  def check_capacity
    @planes.length >= @capacity
  end
end
