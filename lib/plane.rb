require './lib/airport.rb'

class Plane
  attr_reader :current_airport

  def initialize
    @current_airport = ""
  end
  def land(airport)
    if @current_airport == ""
      airport.planes << self
      @current_airport = airport
      "Landed in #{airport}"
    else
      fail "To land plane here please take off from current airport"
    end
  end
  def takeoff
    @current_airport.planes.delete(self)
    puts "Departed from #{@current_airport}"
    @current_airport = ""
  end
end
