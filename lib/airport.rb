require_relative 'weather'
require_relative 'plane'

class Airport

  attr_reader :planes_in_airport, :capacity
  CAPACITY = 100

  def initialize(capacity = CAPACITY)
    @planes_in_airport = []
    @capacity = capacity
  end

  def confirm_take_off(plane)
    fail "This plane is not in the airport" if plane.current_airport != self

    take_off(plane) if weather_ok?
  end

  def confirm_landing(plane)
    fail "This plane is already in the airport" if plane.current_airport == self

    fail "This plane is in another airport" if plane.current_airport != nil

    land(plane) if (space_available? && weather_ok?)
  end

private

  def land(plane)
    plane.park_in_airport(self)
    @planes_in_airport << plane
  end

  def take_off(plane)
    @planes_in_airport.select! { |pia| pia == plane }
    plane.park_in_airport(nil)
    "#{plane} has now left airport"
  end

  def weather_ok?
    Weather.new.random_weather != "stormy"
  end

  def space_available?
    planes_in_airport.count == capacity ? (fail "No space available") : true
  end

end
