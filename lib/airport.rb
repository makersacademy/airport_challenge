require_relative 'plane.rb'

class Airport

  def initialize
    @planes = []
  end
  
  def plane_count
    @planes.count
  end

  def accept_plane(plane)
    "A plane has landed!"
  end

  def release_plane(plane)
    "A plane has taken off!"
  end

end
