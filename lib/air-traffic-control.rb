require './lib/weather'
require './lib/airport'

class AirTrafficControl

  def initialize(hangar_capacity=10)
    @hangar_capacity = hangar_capacity
    @hangar = []
  end

  def connect_with_airside_ops(airport)
    @airport = airport
  end

  def get_weather_status(weather)
    @weather = weather
  end

  def pre_land_checks(plane)
    return "the plane is not airborne" if check_if_plane_is_flying(plane) == false

    return "Planes are prohibited to land due to adverse weather conditions" if check_for_storms

    return "Planes are prohibited to land due to hangar at max. capacity" if @airport.hangar_at_capacity?

    @airport.store(plane)
    plane.has_landed
  end

  def pre_take_off_checks(plane)
    return  "Plane is not stored at this airport" if @airport.plane_stored?(plane) == false

    return  "Planes are grounded due to adverse weather conditions" if check_for_storms

    @airport.release(plane)
    plane.is_flying
  end

  def check_for_storms
    @weather.stormy?
  end

  def check_if_plane_is_flying(plane)
    plane.flying?
  end

end
