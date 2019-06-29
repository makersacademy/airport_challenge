require './lib/weather'

class Airport

  def initialize
    @hangar = []
  end

  def runway_land(plane)
    @hangar << plane
  end

  def runway_takeoff(plane)
    if check_for_storms
      "Planes are grounded due to weather conditions"
    else
      @hangar -= [plane]
    end
  end

  def get_weather_status(weather)
    @weather = weather
  end

  def check_for_storms
    @weather.stormy?
  end

end
