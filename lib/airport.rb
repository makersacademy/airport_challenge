require './lib/climate'
require './lib/plane'

class Airport

  attr_reader :planes, :climate

  def initialize(climate = Climate.new)
    raise 'Error: Parameter is not a climate.' unless climate.is_a?(Climate)
    @planes = []
    @climate = climate
  end

  def build_plane
    planes << Plane.new
  end

  def conditions
    climate.conditions
  end

  def dock_plane(plane)
    raise 'Error: Landing forbidden when weather is stormy.' if conditions == :stormy
    plane.land
    planes << plane
  end

  def release_plane(plane)
    raise 'Error: Take-off forbidden when weather is stormy.' if conditions == :stormy
    plane.take_off
    planes.delete(plane)
  end

end
