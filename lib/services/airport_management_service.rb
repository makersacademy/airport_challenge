require_relative '../domain/airport'

class AirportManagementService

  def initialize
    @airports = []
  end

  def add_airport(airport)
    raise NotAnAirportError.new(airport) if not_an_airport?(airport)
    @airports << airport
    :ok
  end

  def find_airport_by_code(id)
    @airports.find { |plane| plane.code == id } 
  end

  private 

  def not_an_airport?(airport)
    airport.class != Airport
  end

end
