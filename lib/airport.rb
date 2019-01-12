require 'weather'

class Airport

  def initialize(capacity=20, weather_generator=Weather.new)
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

    @planes.push(plane)
  end

  def takeoff(plane)
    return false unless @planes.include?(plane)
    @planes.delete(plane)
  end

  def weather_safe?
    true unless stormy?
  end


  private

  def stormy?
    get_weather == 'stormy'
  end

  def get_weather
    @weather_generator.weather
  end

end


