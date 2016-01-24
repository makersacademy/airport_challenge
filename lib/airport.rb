require './plane.rb'

class Airport

  def initialize
    @in_airport = []
  end

  def land(plane)
    plane.land_plane
    @in_airport << plane
  end
