require_relative "plane"

class Airport

  def initialize
    @in_airport = []
  end

  attr_reader :in_airport

  def request_land(aircraft)
    aircraft.land
    @in_airport << aircraft
    puts "Landed safely" if @in_airport.include?(aircraft)
  end

  def request_depart(aircraft)
    aircraft.take_off
    @in_airport.delete(aircraft)
    puts "aircraft departed" if !@in_airport.include?(aircraft)
  end

end
