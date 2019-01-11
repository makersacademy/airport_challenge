require_relative 'weather'

class Airport

  attr_reader :planes_in_airport, :capacity
  CAPACITY = 100

  def initialize(capacity = CAPACITY)
    @planes_in_airport = []
    @capacity = capacity
  end

  def confirm_take_off(plane)
    take_off(plane) if weather_ok?
  end

  def confirm_landing(plane)
    land(plane) if (space_available? && weather_ok?)
  end

private

  def land(plane)
    @planes_in_airport << plane
  end

  def take_off(plane)
    @planes_in_airport.pop
    "#{plane} has now left airport"
  end

  def weather_ok?
    Weather.new.random_weather != "stormy"
  end

  def space_available?
    @planes_in_airport.count == @capacity ? (fail "No space available") : true
  end

end
