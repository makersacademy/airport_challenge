require_relative 'plane'

class Airport
  def initialize
    @planes = [] # every new instance of airport will have a planes array that stores how many planes are currently landed
  end

  def land(plane)
    @planes << plane

  end

  def depart
    p @planes.pop
    p @planes
  end
end