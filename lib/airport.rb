require_relative './plane'

class Airport

  attr_reader :plane

  def initialize
    @plane = []
  end

  def land(plane)
    # instructs a plane to land at an airport.  A plane will be needed to be able to land
    @plane << plane
    @plane.pop
  end


  def take_off
    @plane >> plane
    p @plane.pop
  end
end

