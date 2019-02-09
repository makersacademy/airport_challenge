class Airport
  attr_reader :at_airport
  def initialize
    @at_airport = []
  end

  def landing(plane)
    @at_airport.push(plane)
    puts @at_airport
    plane
  end

  def takeoff
    if @at_airport.length>0
       @at_airport.shift[-1]
       @at_airport.length
    end
  end
end
