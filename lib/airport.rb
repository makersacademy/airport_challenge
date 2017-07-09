require './lib/Plane.rb'

class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

  def land_plane(plane)
    planes << plane
  end

  def take_off_plane
    planes.pop
  end

end
