require './lib/weather'

class Airport

  attr_reader :hangar_capacity

  def initialize(hangar_capacity=10)
    @hangar_capacity = hangar_capacity
    @hangar = []
  end

  def runway_land(plane)
    return "Planes are prohibited to land due to adverse weather conditions" if check_for_storms

    hangar_at_capacity? ? "Planes are prohibited to land due to hangar at max. capacity" : @hangar << plane
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

  def hangar_at_capacity?
    @hangar.length >= @hangar_capacity
  end

end
