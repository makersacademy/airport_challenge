

# I want to instruct a plane to take 
# off from an airport and confirm that it is no longer in the airport

class Airport
  attr_reader :airport, :capacity
  def initialize
    @airport = []
    @capacity = 5
  end
  
  def plane
    @plane
  end
  def land(plane)
    fail 'it is too stormy' if stormy_weather
    fail 'the runway is full' if full
    @airport.push(plane)
  end
  def leave_airport
    @airport.pop
  end
  def stormy_weather
     rand > 0.9
  end
  def full
    @airport.count >= capacity
  end
end  
