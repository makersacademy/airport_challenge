require_relative 'plane'

class Airport

  attr_reader :landed_planes

  def initialize
    @landed_planes = []
  end

  def land(plane)
    landed_planes << plane
  end

  def take_off(plane)
    departing_flights = []
    departing_flights << plane
    landed_planes.delete plane
  end

end
