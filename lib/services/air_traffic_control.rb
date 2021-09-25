require_relative '../domain/aeroplane'
require_relative '../domain/status_codes'
require_relative '../errors/plane_not_flying_error'

class AirTrafficControl 

  include StatusCodes

  def initialize(
    plane_management_service, 
    airport_management_service, 
    weather_service)
    @plane_management_service = plane_management_service
    @airport_management_service = airport_management_service
    @weather_service = weather_service
  end

  def clear_for_take_off(plane_id)
    plane = find_plane_by_id(plane_id)
    raise PlaneNotAtAirportError.new(plane) if plane_not_at_an_airport?(plane)
    if clear_weather?
      @plane_management_service.update_plane_status(plane_id, TAKE_OFF)
      @airport_management_service.prepare_for_take_off(plane.status, plane_id)
    end
  end

  def take_off(airport_code, plane_id)
    @airport_management_service.take_off(airport_code, plane_id)
    @plane_management_service.update_plane_status(plane_id, FLYING)
  end

  def clear_for_landing(plane_id)
    plane = find_plane_by_id(plane_id)
    raise PlaneNotFlyingError.new(plane) if plane_not_flying?(plane)
    if clear_weather?
      @plane_management_service.update_plane_status(plane_id, LANDING)
      @airport_management_service.prepare_for_landing(plane.status, plane_id)
    end
  end

  def add_plane(plane)
    @plane_management_service.add_plane(plane)
  end

  def add_airport(airport)
    @airport_management_service.add_airport(airport)
  end

  def find_plane_by_id(plane_id)
    @plane_management_service.find_plane_by_id(plane_id)
  end

  def find_airport_by_code(code)
    @airport_management_service.find_airport_by_code(code)
  end

  def get_plane_status(plane_id)
  end

  private

  def plane_not_flying?(plane)
    plane.status != FLYING
  end

  def plane_not_at_an_airport?(plane)
    plane.status == FLYING
  end

  def clear_weather?
    @weather_service.weather_report == CLEAR
  end

end
