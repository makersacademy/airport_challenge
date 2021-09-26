require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :airport

  def initialize
    @airport = []
  end

  def full?
    @airport.length
  end

  def pull_weather
    weather = Weather.new
    forecast = weather.forecast
    forecast
  end

  def takeoff(plane)
    if @airport.empty?
      "Error. There are no planes to take off."
    else
      "Plane has taken off."
      plane
    end
    # fail unless pull_weather "Weather too stormy to take off"
    # plane
    # take off should only happen if the weather is "clear skies"
  end

  def land(plane)
    @airport << plane
    "Plane has landed"
    plane
  end
end
