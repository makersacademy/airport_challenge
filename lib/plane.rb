require_relative '../lib/airport.rb'

class Plane

  attr_reader :id
  attr_reader :at_airport

  def initialize(id)
    @id = id
    @at_airport = "No"
  end

  def land(airport)
    raise 'Landing cannot take place as the Airport has reached full capacity' if airport.capacity == airport.planes.count
    airport.planes << :id
    @at_airport = airport
  end

  def take_off(airport=@at_airport)
    @at_airport.planes.delete(:id)
  end

end