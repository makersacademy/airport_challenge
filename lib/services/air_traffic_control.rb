require_relative '../domain/airport_status_codes'
require_relative '../errors/plane_not_at_airport_error'
require_relative '../errors/plane_not_flying_error'
require_relative '../errors/airport_full_error'

class AirTrafficControl 
  include AirportStatusCodes

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
      @airport_management_service.prepare_for_take_off(plane.status, plane_id)
      @plane_management_service.update_plane_status(plane_id, TAKE_OFF)
      "Plane #{plane.id} (#{plane.name}) cleared for take-off"
    else
      "Plane #{plane.id} (#{plane.name}) deplayed take-off " +
      "due to bad weather at #{find_airport_by_code(plane.status).airport_name}"
    end
  end

  def clear_for_landing(airport_code, plane_id)
    plane = find_plane_by_id(plane_id)
    raise PlaneNotFlyingError.new(plane) if plane_not_flying?(plane)
    if clear_weather?
      attempted_landing(airport_code, plane_id, plane.name)
    else
      "Plane #{plane.id} (#{plane.name}) delayed landing " +
      "due to bad weather at #{find_airport_by_code(airport_code).airport_name}"
    end
  end

  def take_off(airport_code, plane_id)
    attempted_take_off = @airport_management_service.take_off(airport_code)
    if attempted_take_off == OK
      @plane_management_service.update_plane_status(plane_id, FLYING)
      "Successful take off of #{plane_id} at #{airport_code}"
    else
      attempted_take_off
    end 
  end

  def land(airport_code, plane_id)
    plane_landing = @airport_management_service.land(airport_code)
    if plane_landing == OK
      @plane_management_service.update_plane_status(plane_id, airport_code)
      "Successful landing of #{plane_id} at #{airport_code}"
    else
      plane_landing
    end 
  end

  def add_plane(plane)
    @plane_management_service.add_plane(plane)
  end

  def add_airport(airport)
    @airport_management_service.add_airport(airport)
  end

  def view_airport(airport_code)
    airport = find_airport_by_code(airport_code)
    runway_status = airport.plane_using_runway == :empty ? "empty" : "busy"
    p "#{airport.airport_name} (#{airport_code}) has a capacity " +
    "of #{airport.capacity}. The runway is currenty #{runway_status}"
  end

  def view_planes_at_airport(airport_code)
    view_planes(@plane_management_service.find_planes_by_airport(airport_code))
  end

  def view_flying_planes
    view_planes(@plane_management_service.find_flying_planes)
  end

  
  def find_airport_by_code(code)
    @airport_management_service.find_airport_by_code(code)
  end
  
  private
  
  def find_plane_by_id(plane_id)
    @plane_management_service.find_plane_by_id(plane_id)
  end

  def view_planes(planes)
    planes.each_with_index.map { |plane, index| "#{index + 1}: #{plane.id} - #{plane.name}" }
  end

  def attempted_landing(airport_code, plane_id, plane_name)
    begin
      attempted_landing = @airport_management_service.prepare_for_landing(airport_code, plane_id)
      raise AirportFullError.new if attempted_landing == FULL
      @plane_management_service.update_plane_status(plane_id, LANDING)
      "plane #{plane_id} (#{plane_name}) cleared for landing"
    rescue => exception
      p "Plane: #{plane_id} (#{plane_name})"
      p "Airport: #{airport_code}"
      p "Error: " + exception.message 
    end
  end

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
