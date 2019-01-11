require_relative 'weather'

class Airport

  attr_reader :planes_in_airport

  def initialize
    @planes_in_airport = []
  end

  def confirm_take_off(plane)
    weather = check_weather
    take_off(plane) if weather != "stormy"
  end

  def land_plane(plane)
    @planes_in_airport << (plane)
  end

  def take_off(plane)
    @planes_in_airport.pop
    "#{plane} has now left airport"
  end

  def check_weather
    Weather.new.random_weather
  end

end
