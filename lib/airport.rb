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

  def launch_plane
    @parked_planes.pop
  end

end
