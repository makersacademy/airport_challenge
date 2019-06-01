require 'planes'

class Airport
  attr_reader :planes # planes in airport

  def initialize
    @planes = []
  end

  def land_plane
    @planes
  end

  def apron(planes) # planes on the airport 
    fail 'Airport is full' if @planes.count >= 20
    @planes << planes
  end
end


# planes.pop  remove planes from aiport 
# when airport reached capacity no landing
# default airport capacity later can be overridden 