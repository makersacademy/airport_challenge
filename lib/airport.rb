require_relative "weather"
class Airport

  attr_reader :name
  attr_reader :capacity
  attr_reader :planes

  def initialize(name = "airport", capacity = 20)
    @name = name
    @capacity = capacity
    @planes = []
  end

  def take_off(plane)
    @planes.delete(plane)
    return "Plane successfully took off from the airport"
  end

  def land(plane)
    @planes << plane
    return "Plane successfully landed on the airport"
  end

  def full?
    @planes.count >= @capacity
  end

  def weather(weather_report)
    # argument weather_report passed as the parameter being the result of calling
    # current_weather(airport) method on WeatherReport instance whats given us random weather
    weather_report.current_weather(self)
  end

end
