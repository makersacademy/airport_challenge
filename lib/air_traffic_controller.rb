# We need an airtraffic controller to instructs airport to receive planes
require_relative 'airport'

class AirTrafficController

  def instruct_landing(airport, plane)
      airport.land_plane(plane)
  end

  def instruct_takeoff(airport, plane)
      airport.takeoff_plane(plane)
  end

end
