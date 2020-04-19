require './lib/airport.rb'

class Plane
  attr_reader :current_airport

  def initialize
    @current_airport = ""
  end

  def land(airport)
    fail "To land plane here please take off from current airport" if @current_airport != ""
    fail "This airport is full" if airport.capacity == airport.plane_count

    airport.planes << self
    @current_airport = airport
    "Landed in #{airport}"
  end

  def takeoff
    @current_airport.planes.delete(self)
    puts "Departed from #{@current_airport}"
    @current_airport = ""
  end
end
