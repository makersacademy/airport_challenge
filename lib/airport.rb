require_relative "./weather"
require_relative "./plane"

class Airport

  attr_reader(:capacity)
  attr_reader(:planes)

  def initialize(weather = Weather.new, capacity = 2)
    @local_weather = weather
    @capacity = capacity
    @planes = []
  end

  def takeoff
    raise "Cant take off due to stormy weather" unless @local_weather.forcast == "sunny"

    Plane.new
  end

  def land(plane)
    raise "That plane isn't in the air" unless plane.status == "flying"

    raise "Cant land here due to stormy weather" unless @local_weather.forcast == "sunny"

    @planes.push(plane)
  end
end
