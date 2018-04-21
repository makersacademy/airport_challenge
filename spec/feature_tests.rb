require_relative '../lib/airport'
require_relative '../lib/plane'

class Tests

  attr_reader :airport1, :airport2, :plane1, :plane2

  def test_set_departure_airport
    puts __method__.to_s
    count = 0
    print "   Test #{ count += 1 }: "
    plane = Plane.new
    airport = Airport.new
    plane.set_departure_airport(airport)
    if plane.departure_airport == airport && airport.planes.include?(plane)
      puts "Success"
    else
      puts "Failure"
    end
    print "   Test #{ count += 1 }: "
    begin
      plane.set_departure_airport(airport)
    rescue PlaneError
      puts "Success"
    else
      puts "Failure"
    end
  end

  def test_set_destination_airport

  end

end
