require_relative 'plane'

class Airport

  attr_reader :planes_on_ground

  def initialize
    @planes_on_ground = []
  end

  def land_plane(plane)
    @planes_on_ground.push(plane.land(self))
  end

  def takeoff_plane(plane, destination)
    @planes_on_ground.delete(plane.takeoff(self))
  end
  
end