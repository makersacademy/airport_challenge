require_relative '../errors/not_an_airport_error'
require_relative '../errors/plane_not_at_airport_error'
require_relative '../domain/airport_status_codes'

class AirportManagementService
  include AirportStatusCodes

  UNMANAGED_AIRPORT_MESSAGE = "Unrecognised airport".freeze

  def initialize
    @airports = []
  end

  def prepare_for_take_off(airport_code, plane_id)
    airport = find_airport_by_code(airport_code)
    raise NotAnAirportError.new(airport_code) if not_an_airport?(airport)
    airport.prepare_for_take_off(plane_id)
  end

  def prepare_for_landing(airport_code, plane_id)
    airport = find_airport_by_code(airport_code)
    raise NotAnAirportError.new(airport_code) if not_an_airport?(airport)
    airport.prepare_for_landing(plane_id)
  end 

  def take_off(airport_code)
    airport = find_airport_by_code(airport_code)
    raise NotAnAirportError.new(airport_code) if not_an_airport?(airport)
    airport.take_off
  end

  def land(airport_code)
    airport = find_airport_by_code(airport_code)
    raise NotAnAirportError.new(airport_code) if not_an_airport?(airport)
    airport.land
  end

  def add_airport(airport)
    raise NotAnAirportError.new(airport) if not_an_airport?(airport)
    @airports << airport
    :ok
  end

  def find_airport_by_code(code)
    raise PlaneNotAtAirportError.new(code) if not_at_airport(code)
    @airports.find { |plane| plane.code == code } 
  end

  private 

  def not_at_airport(code)
    code == LANDING || code == FLYING || code == TAKE_OFF
  end

  def not_an_airport?(airport)
    airport.class != Airport
  end

end
