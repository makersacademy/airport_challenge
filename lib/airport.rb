require_relative 'weather'

class Airport

  attr_reader :planes_in_airport, :capacity
  CAPACITY = 100

  def initialize(capacity = CAPACITY)
    @planes_in_airport = []
    @capacity = capacity
  end

  def confirm_take_off
#    fail "This plane is already in the airport" if in_airport? == false
    take_off if weather_ok?
  end

  def confirm_landing(plane)
    fail "This plane is already in the airport" if in_airport?(plane)
    land(plane) if (space_available? && weather_ok?)
  end

private

  def land(plane)
    @planes_in_airport << plane
  end

  def take_off
    plane = @planes_in_airport.pop
    "#{plane} has now left airport"
  end

  def weather_ok?
    Weather.new.random_weather != "stormy"
  end

  def space_available?
    @planes_in_airport.count == @capacity ? (fail "No space available") : true
  end

  def in_airport?(plane)
    @planes_in_airport.include? plane #? (fail "This plane is already in the airport") : false
  end

end
