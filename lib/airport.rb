require_relative 'plane'

class Airport

  attr_reader :stored_planes
  def initialize
    @stored_planes = []
  end

  def land(plane)
  end
  
  def takeoff(plane) 
    raise "Plane has left"
  end
end
