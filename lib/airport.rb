require_relative "./weather"
require_relative "./plane"

class Airport
  def initialize(weather = Weather.new)
    @local_weather = weather
  end

  def takeoff
    raise "Cant take off due to stormy weather" unless @local_weather.forcast == "sunny"

    Plane.new
  end

  def land(plane)
    plane
  end
end
