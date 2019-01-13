require_relative 'plane'

class Airport
  attr_accessor :airport
  self::DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @airport = []
  end

  def land(plane)
    return "cant land plane due to stormy weather" if weather == 'stormy'

    full? ? (fail "Airport is full") : @airport.push(plane)
  end

  def takeoff(plane)
    return "cant take off due to stormy weather" if weather == 'stormy'

    @airport.delete(plane)
    return "The plane has left the airport - see: #{@airport}"
  end

  def weather
    possible_weather = ['fine', 'fine', 'fine', 'fine', 'stormy']
    fine_or_stormy = possible_weather[rand(5)]
    # puts "weather is #{fine_or_stormy} "
    return fine_or_stormy
  end

  def full?
    @airport.count >= @capacity
  end

end
