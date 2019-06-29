require './lib/weather'

class Airport

  def initialize
    @hangar = []
  end

  def runway_land(plane)
    @hangar << plane
  end

  def runway_takeoff(plane)
   check_for_storms ? "Planes are grounded due to adverse weather conditions" : @hangar -= [plane]
  end

  def get_weather_status(weather)
    @weather = weather
  end

  def check_for_storms
    @weather.stormy?
  end

end
