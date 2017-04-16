require './lib/climate'

class Airport

  attr_reader :planes, :climate

  def initialize
    @planes = []
    @climate = Climate.new
  end

  def conditions
    climate.conditions
  end

  def dock_plane(plane)
    plane.land
    planes << plane
  end

  def release_plane(plane)
    plane.take_off
    planes.delete(plane)
  end

end
