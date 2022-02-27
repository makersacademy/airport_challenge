require_relative 'airport'
require_relative 'airplane'

class AirTrafficController

  def land_plane(plane, airport)
    airport.receive_plane(plane)
  end

  def take_off_plane(plane, airport)
    airport.take_off_plane(plane)
  end
end
