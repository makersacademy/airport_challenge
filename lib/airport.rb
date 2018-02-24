require 'plane.rb'

class Airport
  attr_accessor :parked_planes

  def initialize
    @parked_planes = []
  end

  def park_plane(plane)
    @parked_planes.push(plane)
  end

  def find_plane(plane)
    @parked_planes.index(plane)
  end

  def land(plane)
    plane.land
  end

  def launch_plane(plane)
    @parked_planes.delete_at(find_plane(plane))
  end

  def takeoff(plane)
    plane.takeoff
  end

end
