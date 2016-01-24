require_relative 'plane'

class Airport

  attr_reader :landed_planes

  def initialize
    @landed_planes = []
  end

  def land(plane)
    fail 'Cannot land due to stormy weather'
      if weather_conditions < 3
    landed_planes << plane
  end

  def take_off(plane)
    fail 'Cannot take off due to stormy weather' 
      if weather_conditions < 3
    departing_flights = []
    departing_flights << plane
    landed_planes.delete plane
  end

  def weather_conditions
    rand(10)
  end

end
