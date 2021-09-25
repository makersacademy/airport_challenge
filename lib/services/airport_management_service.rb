require_relative '../domain/airport'

class AirportManagementService

  def initialize
    @airports = []
  end

  def add_airport(airport)
    if not_an_airport?(airport)
      raise NotAnAirportError.new(airport)
    else
      @airports << airport
      :ok
    end
  end

  def find_airport_by_code(id)
    @airports.find { |plane| plane.code == id} 
  end

  private 

  def not_an_airport?(airport)
    airport.class != Airport
  end

end