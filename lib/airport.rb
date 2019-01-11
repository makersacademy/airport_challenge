require_relative 'weather'

class Airport

  attr_reader :planes_in_airport

  def initialize
    @planes_in_airport = []
    @capacity = 100
  end

  def confirm_take_off(plane)
    weather = check_weather
    take_off(plane) if (weather != "stormy")
  end

  def confirm_landing(plane)
    weather = check_weather
    land(plane) if (weather != "stormy" && space_available? == true )
  end

private

  def land(plane)
    @planes_in_airport << plane
  end

  def take_off(plane)
    @planes_in_airport.pop
    "#{plane} has now left airport"
  end

  def check_weather
    Weather.new.random_weather
  end

  def space_available?
    @planes_in_airport.count == @capacity ? (raise "No space available") : true
  end

end
