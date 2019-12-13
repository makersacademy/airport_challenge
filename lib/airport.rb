require_relative 'plane'

class Airport
attr_reader :planes_airport

  def initialize
    @planes_airport = []
  end

  def land_plane(plane)
    planes_airport << plane
  end

  def take_off(plane)
  planes_airport.pop
  "In the air"
  end

end
