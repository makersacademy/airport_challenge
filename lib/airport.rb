require_relative "./weather"
require_relative "./plane"

class Airport
  def initialize(weather)
    @local_weather = weather
  end

  def takeoff
    raise "Cant take off due to stormy weather" unless @local_weather.forcast == "sunny"
    
    Plane.new
  end
end
