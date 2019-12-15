require_relative "weather_service"

class Airport

attr_reader :name
attr_reader :planes
attr_reader :capacity

  def initialize(name = "airport", capacity = 50)
    @name = name
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    @planes << plane
    return "Plane landed successfully at airport"
  end

  def take_off(plane)
    @planes.delete(plane)
    return "Plane took off successfully from airport"
  end

  def full?
    @planes.count >= @capacity ? true : false
  end

  def weather(weather_service)
    weather_service.current_weather(self)
  end
end
