require 'weather'

# Understand how to manage planes in different weather conditions

class Airport

  attr_reader :planes_in_airport

  def initialize(weather: Weather.new)
    @planes_in_airport = []
    @weather = weather
  end

  def land(plane)
    fail "Can't land due to stormy weather" if stormy?
    @planes_in_airport << plane
    print "The plane landed succesfully"
  end

  def take_off(plane)
    @planes_in_airport.delete(plane)
    print "The plane took off succesfully"
  end

  private
  def stormy?
    @weather.stormy?
  end
end
