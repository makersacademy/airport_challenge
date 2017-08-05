require_relative './plane'

class Airport

  def initialize
    @plane = plane
  end
  
  attr_reader :plane

  def land_plane(plane)
    @plane = plane
  end
  
  def plane_left_airport?
    " #{@plane} has left the airport"
  end
   

end
