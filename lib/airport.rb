require './lib/plane.rb'

class Airport

  def initialize
    @plane = []
  end

  def release_plane(plane)
    plane
  end

  def accept_plane(plane)
    @plane << plane
  end

end
