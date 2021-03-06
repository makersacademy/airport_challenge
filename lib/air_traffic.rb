require './lib/plane'
require './lib/airport'
require './lib/register'

class AirTraffic
  attr_reader :airports, :planes

  def initialize
    @airports = [Airport.new]
    @planes = [Plane.new]
  end

  def interrogate(plane)
    plane.location
  end

  def land(plane, airport)
    plane.land(airport)
  end

  def takeoff(plane, destination_airport)
    plane.takeoff(destination_airport)
  end
end
