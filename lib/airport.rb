require './lib/plane'

class Airport
  attr_reader :plane

  def land_plane(plane)
    raise "Permission not granted. The airport is full." unless @plane.nil?
    @plane = plane
  end

  def launch_plane(plane)
    plane
  end
end
