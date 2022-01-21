require 'plane'

class Airport

  attr_reader :terminal

  def land_plane(plane = Plane.new)
    @plane = plane
    terminal = []
    terminal << plane
    "#{@plane} has landed"
  end

end
