require_relative 'plane'

class Airport

  def initialize
    @planes = []
  end

  def clear_for_takeoff
    my_plane = @planes.pop
    my_plane.fly
    my_plane
  end

  def clear_for_landing(plane)
    plane.land
    @planes << plane
  end
end
