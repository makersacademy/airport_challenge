require_relative 'plane'

class Airport

DEFAULT_CAPACITY = 200
  attr_reader :landed_planes, :capacity

  def initialize (capacity=DEFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity
  end

  def land(plane)
    if full?
      raise 'Runway is full, unable to land'
    end
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

  def full?
    landed_planes.size >= capacity
  end

end
