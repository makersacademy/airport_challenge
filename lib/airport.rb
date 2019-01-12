require 'weather'

class Airport

  def initialize(capacity = 20, weather_generator = Weather.new)
    @capacity = capacity
    @planes = []
    @weather_generator = weather_generator
  end

  def full?
    @planes.length >= @capacity
  end

  def land(plane)
    raise 'Unable to land: airport full' if full?
    raise 'Unable to land: stormy weather' unless weather_safe?

    plane.land
    @planes.push(plane)
  end

  def takeoff(plane)
    raise 'Unable to takeoff: plane unavailable' unless @planes.include?(plane)
    raise 'Unable to takeoff: stormy weather' unless weather_safe?

    @planes.delete(plane)
  end

  def weather_safe?
    true unless stormy?
  end

  private

  def stormy?
    weather == 'stormy'
  end

  def weather
    @weather_generator.weather
  end

end
