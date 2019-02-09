require_relative 'plane.rb'
class Airport
  attr_reader :planes

  def land_plane(plane)
    @planes = [plane]
  end

  def take_off(plane)
    @planes.pop
  end

end
