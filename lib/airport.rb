require_relative 'plane'

class Airport 

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    @planes.delete(plane)
    "The plane has taken off and left the airport"
  end


end
