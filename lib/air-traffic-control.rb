require './lib/weather'

class AirTrafficControl

  attr_reader :hangar_capacity

  def initialize(hangar_capacity=10)
    @hangar_capacity = hangar_capacity
    @hangar = []
  end

  def pre_land_checks(plane)
    return "Planes are prohibited to land due to adverse weather conditions" if check_for_storms

    hangar_at_capacity? ? "Planes are prohibited to land due to hangar at max. capacity" : @hangar << plane

  end

  def pre_take_off_checks(plane)
    return  "Planes are grounded due to adverse weather conditions" if check_for_storms
    check_if_plane_is_flying(plane) ? "The plane is already flying" : @hangar -= [plane]
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

  def check_if_plane_is_flying(plane)
    plane.flying?
  end

end
