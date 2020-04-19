require './lib/airport.rb'

class Plane
  attr_reader :current_airport

  def initialize
    @current_airport = ""
  end
  def land(airport)
    fail "To land plane here please take off from current airport" if @current_airport != ""
    if airport.capacity == airport.plane_count
      fail "This airport is full"
    else
      airport.planes << self
      @current_airport = airport
      "Landed in #{airport}"
    end
  end
  def takeoff
    @current_airport.planes.delete(self)
    puts "Departed from #{@current_airport}"
    @current_airport = ""
  end
end
