require_relative 'plane'

class Airport

  attr_reader :landed_planes

  def initialize
    @landed_planes = []
  end

  def land(plane)
    if weather_conditions < 3
      raise 'Cannot land due to stormy weather'
    end
    landed_planes << plane
  end

  def take_off(plane)
    if weather_conditions < 3
      raise 'Cannot take off due to stormy weather'
    end
    departing_flights = []
    departing_flights << plane
    landed_planes.delete plane
  end

  def weather_conditions
    rand(10)
  end

end
