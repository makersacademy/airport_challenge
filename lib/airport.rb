require_relative 'plane.rb'

class Airport
  attr_reader :planes
  def initialize
    @planes = []
  end

  def land_plane(plane)
    @planes << plane
  end

  def takeoff_plane(plane)
    planes_for_takeoff = @planes.select { plane }
    plane_for_takeoff = planes_for_takeoff.pop
    @planes.delete(plane_for_takeoff)
    return plane_for_takeoff
  end
end
